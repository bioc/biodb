#' Class for handling a Mass spectrometry database in SQLite format.
#'
#' This is the connector class for a MASS SQLite database.
#'
#' @seealso Super class \code{\link{SqliteConn}}.
#'
#' @examples
#' # Create an instance with default settings:
#' mybiodb <- biodb::newInst()
#'
#' # Get path to LCMS database example file
#' lcmsdb <- system.file("extdata", "massbank_extract.sqlite", package="biodb")
#'
#' # Create a connector
#' conn <- mybiodb$getFactory()$createConn('mass.sqlite', url=lcmsdb)
#'
#' # Get an entry
#' e <- conn$getEntry('34.pos.col12.0.78')
#'
#' # Terminate instance.
#' mybiodb$terminate()
#'
#' @import R6
#' @import sqlq
#' @include SqliteConn.R
#' @export
MassSqliteConn <- R6::R6Class('MassSqliteConn',
inherit=SqliteConn,

public=list(
),

private=list(

doGetMzValues=function(ms.mode, max.results, precursor, ms.level) {
    # Overwrites super class' method

    mz <- numeric()

    private$initDb()

    if ( ! is.null(private$db)) {

        # Get M/Z field name
        mzfield <- self$getMatchingMzField()

        if ( ! is.null(mzfield)) {
            mzfield <- private$fieldToSqlId(mzfield)

            # Build query
            query <- private$createMsQuery(mzfield, fields=mzfield,
                                           ms.mode=ms.mode, ms.level=ms.level,
                                           precursor=precursor,
                                           limit=max.results)
            logDebug('Run query "%s".', query$toString())

            # Run query
            df <- self$getQuery(query)
            mz <- df[[1]]
        }
    }

    return(mz)
},

createMsQuery=function(mzfield, fields, ms.mode=NULL, ms.level=0,
                       precursor=FALSE, limit=0, cond=NULL) { 

  # Create SQL query
  and <- sqlq::ExprCommOp$new('and')
  if (!is.null(cond))
    for (expr in cond)
      and$add(expr)
  where <- sqlq::make_where(and)
  query <- sqlq::make_select(mzfield, fields=fields, distinct=TRUE,
                             where=where, limit=limit)

  if (precursor) {
    query$add(sqlq::make_join('accession', 'msprecmz', 'accession', mzfield))
    and$add(sqlq::ExprBinOp$new(sqlq::ExprField$new('msprecmz', 'msprecmz'),
                                '=', sqlq::ExprField$new(mzfield, mzfield)))
  }
  joined_entries <- FALSE
  if ( ! is.null(ms.level) && ! is.na(ms.level)
      && (is.numeric(ms.level) || is.integer(ms.level)) && ms.level > 0) {
    query$add(sqlq::make_join('accession', 'entries', 'accession', mzfield))
    joined_entries <- TRUE
    and$add(sqlq::ExprBinOp$new(sqlq::ExprField$new('ms.level', 'entries'),
                                '=', sqlq::ExprValue$new(ms.level)))
  }
  if ( ! is.null(ms.mode) && ! is.na(ms.mode) && is.character(ms.mode)) {
    if (!joined_entries)
      query$add(sqlq::make_join('accession', 'entries', 'accession', mzfield))
    and$add(sqlq::ExprBinOp$new(sqlq::ExprField$new('ms.mode', 'entries'),
                                '=', sqlq::ExprValue$new(ms.mode)))
  }

  return(query)
},

doSearchMzRange=function(mz.min, mz.max, min.rel.int, ms.mode, max.results,
precursor, ms.level) {

  ids <- character()
  private$initDb()
  if ( ! is.null(private$db)) {

    # Get M/Z field name
    mzfield <- self$getMatchingMzField()

    if ( ! is.null(mzfield)) {
      mzfield <- private$fieldToSqlId(mzfield)

      cond <- list()

      # Build the conditions on M/Z ranges
      mz.range.or <- sqlq::ExprCommOp$new('or')
      for (i in seq_along(if (is.null(mz.max)) mz.min else mz.max)) {
        and <- sqlq::ExprCommOp$new('and')
        if ( ! is.null(mz.min) && ! is.na(mz.min[[i]])) {
          val <- sqlq::ExprValue$new(as.numeric(mz.min[[i]]))
          and$add(sqlq::ExprBinOp$new(sqlq::ExprField$new(mzfield, mzfield),
                                      '>=', val))
        }
        if ( ! is.null(mz.max) && ! is.na(mz.max[[i]])) {
          val <- sqlq::ExprValue$new(as.numeric(mz.max[[i]]))
          and$add(sqlq::ExprBinOp$new(sqlq::ExprField$new(mzfield, mzfield),
                                      '<=', val))
        }
        mz.range.or$add(and)
      }
      if (length(mz.range.or$nb_expr()) > 0)
        cond <- c(cond, mz.range.or)

      # Build the conditions on relative intensity
      if ('peak.relative.intensity' %in% DBI::dbListTables(private$db)
          && ! is.null(min.rel.int) && ! is.na(min.rel.int)
          && (is.numeric(min.rel.int) || is.integer(min.rel.int))) {
        query$add(sqlq::make_join('accession', mzfield,
                                  'peak.relative.intensity',
                                  'peak.relative.intensity'))
        cond <- c(cond, sqlq::ExprBinOp$new(
                    sqlq::ExprField$new('peak.relative.intensity',
                                        'peak.relative.intensity'),
                    '>=', sqlq::ExprValue$new(as.numeric(min.rel.int))))
      }

      # Build query
      fields <- list(sqlq::ExprField$new('accession', mzfield))
      query <- private$createMsQuery(mzfield=mzfield, fields=fields,
                                     ms.mode=ms.mode, ms.level=ms.level,
                                     precursor=precursor, cond=cond,
                                     limit=max.results)

      # Run query
      logDebug('Run query "%s".', query$toString())
      df <- self$getQuery(query)
      ids <- df[[1]]
    }
  }

  return(ids)
}

,doGetChromCol=function(ids=NULL) {

  chrom.cols <- data.frame(id=character(0), title=character(0))

  private$initDb()

  if ( ! is.null(private$db)) {

    tables <- DBI::dbListTables(private$db)

    if ('entries' %in% tables) {

      fields <- DBI::dbListFields(private$db, 'entries')
      fields.to.get <- c('chrom.col.id', 'chrom.col.name')

      if (all(fields.to.get %in% fields)) {

        # Filter on spectra IDs
        where <- NULL
        if ( ! is.null(ids))
          where <- sqlq::make_where(
            sqlq::ExprBinOp$new(sqlq::ExprField$new('accession'),
                                'in', sqlq::make_values(ids)))

        # Create query
        query <- sqlq::make_select('entries', fields=fields.to.get, where=where,
                                   distinct=TRUE)

        # Run query
        chrom.cols <- self$getQuery(query)
        names(chrom.cols) <- c('id', 'title')
      }
    }
  }

  return(chrom.cols)
}
))
