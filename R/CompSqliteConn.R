#' Class for handling a Compound database in SQLite format.
#'
#' This is the connector class for a Compound database.
#'
#' @seealso Super class \code{\link{SqliteConn}}.
#'
#' @examples
#' # Create an instance with default settings:
#' mybiodb <- biodb::newInst()
#'
#' # Get a connector:
#' chebi_file <- system.file("extdata", "chebi_extract.sqlite", package="biodb")
#' conn <- mybiodb$getFactory()$createConn('comp.sqlite', url=chebi_file)
#'
#' # Get an entry
#' e <- conn$getEntry('1018')
#'
#' # Terminate instance.
#' mybiodb$terminate()
#'
#' @import R6
#' @import sqlq
#' @include SqliteConn.R
#' @export
CompSqliteConn <- R6::R6Class('CompSqliteConn',
inherit=SqliteConn,


public=list(


),

private=list(
doSearchForEntries=function(fields=NULL, max.results=0) {
    # Overrides super class' method.

    ids <- character()
    private$initDb()

    if ( ! is.null(private$db)) {

        # Create SQL query
        and <- sqlq::ExprCommOp$new('and')
        where <- sqlq::make_where(and)
        fields <- list(sqlq::ExprField$new('accession', 'entries'))
        query <- sqlq::make_select('entries',
                                   fields = fields,
                                   distinct=TRUE, limit=max.results,
                                   where=where)

        # Search by name
        if ('name' %in% names(fields)) {
          query$add(sqlq::make_join('accession', 'name',
                                    'accession', 'entries'))
          and$add(sqlq::ExprBinOp$new(
                    sqlq::ExprField$new('name', 'name'),
                    '=', sqlq::ExprValue$new(fields$name)))
        }
        
        # Search by mass
        ef <- self$getBiodb()$getEntryFields()
        for (field in names(fields)) {
            
            # This is a mass field
            if (ef$get(field)$getType() == 'mass') {
                param <- fields[[field]]
                
                # Compute range
                if ('min' %in% names(param)) {
                    private$checkMassField(mass=param$min, mass.field=field)
                    rng <- list(a=param$min, b=param$max)
                }
                else {
                    private$checkMassField(mass=param$value, mass.field=field)
                    if ('delta' %in% names(param))
                        rng <- convertTolToRange(param$value, param$delta,
                            'delta')
                    else
                        rng <- convertTolToRange(param$value, param$ppm, 'ppm')
                }
                
                # Complete query
                and$add(sqlq::ExprBinOp$new(
                    sqlq::ExprField$new(field, 'entries'),
                    '>=', sqlq::ExprValue$new(rng$a)))
                and$add(sqlq::ExprBinOp$new(
                    sqlq::ExprField$new(field, 'entries'),
                    '<=', sqlq::ExprValue$new(rng$b)))
            }
        }

        # Run query
        x <- self$getQuery(query)
        ids <- x[[1]]
    }
    
    return(ids)
}
))
