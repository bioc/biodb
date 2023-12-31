test.convertEntryIdFieldToDbClass <- function(biodb) {

    # Check all databases
    for (db in biodb$getDbsInfo()$getAll())
        testthat::expect_equal(biodb$convertEntryIdFieldToDbClass(db$getEntryIdField()), db$getDbClass())

    # Check a wrong database name
    testthat::expect_null(biodb$convertEntryIdFieldToDbClass('chebi'))
    testthat::expect_null(biodb$convertEntryIdFieldToDbClass('blabla.id'))
}

test.collapseRows <- function(biodb) {

    # Basic tests
    testthat::expect_null(biodb$collapseRows(NULL))
    testthat::expect_identical(data.frame(), biodb$collapseRows(data.frame()))
    testthat::expect_identical(data.frame(a=1), biodb$collapseRows(data.frame(a=1)))
    testthat::expect_identical(data.frame(a=c(1,2)), biodb$collapseRows(data.frame(a=c(1,2))))
    testthat::expect_identical(data.frame(a=c(1,2)), biodb$collapseRows(data.frame(a=c(1,2,2))))
    testthat::expect_identical(data.frame(a=c(1,2),b=c('5','5|7'), stringsAsFactors=FALSE), biodb$collapseRows(data.frame(a=c(1,2,2),b=c(5,5,7))))

    # Test with a different separator
    # Decompose test because of the following error on Bioconductor:
    # Error in `name %in% base || grepl("^%.*%$", name)`: 'length(x) = 3 > 1'
    # in coercion to 'logical(1)'
    #   Backtrace:
    #       █
    #    1. ├─base::do.call(fct, params)
    #    2. └─(function (biodb) ...
    #    3.   └─testthat::expect_identical(...) test_030_biodb.R:23:8
    #    4.     └─testthat::quasi_label(enquo(expected), expected.label, arg =
    #               "expected")
    #    5.       ├─label %||% expr_label(expr)
    #    6.       └─testthat:::expr_label(expr)
    #    7.         └─testthat:::is_call_infix(x)
    x <- data.frame(a=c(1,2),b=c('5','5;7'), stringsAsFactors=FALSE)
    y <- biodb$collapseRows(data.frame(a=c(1,2,2),b=c(5,5,7)), sep=';')
    testthat::expect_identical(x, y)

    # Test with NA values
    x <- data.frame(a=c(1,NA,NA,2),b=c('5',NA,6,'5|7'), stringsAsFactors=FALSE)
    y <- biodb$collapseRows(data.frame(a=c(1,NA,NA,2,2),b=c(5,NA,6,5,7)))
    testthat::expect_identical(x, y)
}

test.entriesToDataframe <- function(biodb) {

    # Create database
    db <- data.frame(
        accession=c("A1", "A2", "A3", "A3", "A3"),
        formula=c("C3H10N2", "C6H12O6", "C6H8O7", "C6H8O7", "C6H8O7"),
        msprecmz=c(80, 90, 100, 110, 120),
        stringsAsFactors=FALSE)

    # Create connector
    conn <- biodb$getFactory()$createConn('mass.csv.file')
    conn$setDb(db)

    # Test
    x <- biodb$entriesToDataframe(list())
    testthat::expect_identical(data.frame(), x) 
    ids <- conn$getEntryIds()
    testthat::expect_length(ids, 3)
    entries <- conn$getEntry(ids)
    testthat::expect_length(entries, 3)
    x2 <- biodb$entriesToDataframe(entries, fields=character())
    testthat::expect_true(identical(data.frame(), x2))
    x3 <- biodb$entriesToDataframe(entries, fields=c('formula'))
    y3 <- unique(db['formula'])
    testthat::expect_identical(y3, x3)
    x4 <- biodb$entriesToDataframe(entries, fields=c('formula'), drop=TRUE)
    testthat::expect_identical(unique(db$formula), x4)
    x5 <- biodb$entriesToDataframe(entries, fields=c('accession', 'formula'))
    testthat::expect_identical(unique(db[c('accession', 'formula')]), x5)

    # Test with limit
    sep <- biodb$getConfig()$get('multival.field.sep')
    x7 <- biodb$entriesToDataframe(entries, limit=2, drop=TRUE, flatten=TRUE,
                                   only.atomic=FALSE, fields='msprecmz')
    y7 <- c(80, 90, paste(c(100, 110), collapse=sep))
    testthat::expect_identical(y7, x7)

    # Delete connector
    biodb$getFactory()$deleteConn(conn$getId())
}

test.entriesToDataframe.listOfListInput <- function(biodb) {

    # Create database
    db <- data.frame(
        accession=c("A1", "A2", "A3", "A3", "A3"),
        formula=c("C3H10N2", "C6H12O6", "C6H8O7", "C6H8O7", "C6H8O7"),
        msprecmz=c(80, 90, 100, 110, 120),
        stringsAsFactors=FALSE)

    # Create connector
    conn <- biodb$getFactory()$createConn('mass.csv.file')
    conn$setDb(db)
    ids <- conn$getEntryIds()
    entries <- conn$getEntry(ids)
    e1 <- entries[[1]]
    e2 <- entries[[2]]
    e3 <- entries[[3]]
    fsep <- biodb$getConfig()$get('multival.field.sep')
    esep <- biodb$getConfig()$get('entries.sep')

    # Test
    x1 <- biodb$entriesToDataframe(list(list()))
    testthat::expect_identical(data.frame(), x1)
    x2 <- biodb$entriesToDataframe(list(list(), list()))
    testthat::expect_equal(data.frame(), x2)
    x3 <- biodb$entriesToDataframe(list(e3, list(e1,e2)), own.id=FALSE)
    y3 <- data.frame(accession=c('A3', paste('A1', 'A2', sep=esep)),
                     formula=c("C6H8O7", paste("C3H10N2", "C6H12O6", sep=esep)),
                     msprecmz=c(paste(100, 110, 120, sep=fsep),
                                paste(80, 90, sep=esep)),
                     stringsAsFactors=FALSE)
    testthat::expect_identical(y3, x3)

    # Delete connector
    biodb$getFactory()$deleteConn(conn$getId())
}

test.entryIdsToDataframe <- function(biodb) {

    # Create database
    db <- data.frame(
        accession=c("A1", "A2", "A3", "A3", "A3"),
        formula=c("C3H10N2", "C6H12O6", "C6H8O7", "C6H8O7", "C6H8O7"),
        msprecmz=c(80, 90, 100, 110, 120),
        stringsAsFactors=FALSE)

    # Create connector
    conn <- biodb$getFactory()$createConn('mass.csv.file')
    conn$setDb(db)

    # Test
    x <- biodb$entryIdsToDataframe(character(), db=conn$getId())
    testthat::expect_identical(data.frame(), x) 
    ids <- conn$getEntryIds()
    x2 <- biodb$entryIdsToDataframe(ids, db=conn$getId(), fields=character())
    testthat::expect_true(identical(data.frame(), x2))
    x5 <- biodb$entryIdsToDataframe(ids, db=conn$getId(),
                                    fields=c('accession', 'formula'))
    testthat::expect_identical(unique(db[c('accession', 'formula')]), x5)

    # Test with limit
    sep <- biodb$getConfig()$get('multival.field.sep')
    x7 <- biodb$entryIdsToDataframe(ids, db=conn$getId(), limit=2,
                                    fields='msprecmz')
    y7 <- data.frame(msprecmz=c(80, 90, paste(c(100, 110), collapse=sep)),
                     stringsAsFactors=FALSE)
    testthat::expect_identical(y7, x7)

    # Delete connector
    biodb$getFactory()$deleteConn(conn$getId())
}

test.entryIdsToDataframe.listOfListInput <- function(biodb) {

    # Create database
    db <- data.frame(
        accession=c("A1", "A2", "A3", "A3", "A3"),
        formula=c("C3H10N2", "C6H12O6", "C6H8O7", "C6H8O7", "C6H8O7"),
        msprecmz=c(80, 90, 100, 110, 120),
        stringsAsFactors=FALSE)

    # Create connector
    conn <- biodb$getFactory()$createConn('mass.csv.file')
    conn$setDb(db)
    ids <- conn$getEntryIds()
    id1 <- ids[[1]]
    id2 <- ids[[2]]
    id3 <- ids[[3]]
    fsep <- biodb$getConfig()$get('multival.field.sep')
    esep <- biodb$getConfig()$get('entries.sep')

    # Test
    x1 <- biodb$entryIdsToDataframe(list(character()), db=conn$getId())
    testthat::expect_identical(data.frame(), x1)
    x2 <- biodb$entryIdsToDataframe(list(character(), character()),
                                    db=conn$getId())
    testthat::expect_identical(data.frame(), x2)
    x3 <- biodb$entryIdsToDataframe(list(id3, c(id1,id2)), own.id=FALSE,
                                    db=conn$getId())
    y3 <- data.frame(accession=c('A3', paste('A1', 'A2', sep=esep)),
                     formula=c("C6H8O7", paste("C3H10N2", "C6H12O6", sep=esep)),
                     msprecmz=c(paste(100, 110, 120, sep=fsep),
                                paste(80, 90, sep=esep)),
                     stringsAsFactors=FALSE)
    testthat::expect_identical(y3, x3)

    # Delete connector
    biodb$getFactory()$deleteConn(conn$getId())
}

test.addColsToDataframe <- function(biodb) {

    # Create database
    db <- data.frame(
        accession=c("A1", "A2", "A3", "A3", "A3"),
        formula=c("C3H10N2", "C6H12O6", "C6H8O7", "C6H8O7", "C6H8O7"),
        msprecmz=c(80, 90, 100, 110, 120),
        stringsAsFactors=FALSE)

    # Create connector
    conn <- biodb$getFactory()$createConn('mass.csv.file')
    conn$setDb(db)

    # Input data frame
    idf <- data.frame(ids=c("A2", "A3"), col2=c(1, 2), stringsAsFactors=FALSE)

    # Test
    x <- biodb$addColsToDataframe(data.frame(), db=conn$getId())
    testthat::expect_identical(data.frame(), x) 
    x2 <- biodb$addColsToDataframe(idf, id.col='ids', db=conn$getId(), fields=character())
    testthat::expect_true(identical(idf, x2))

    # Test with limit
    sep <- biodb$getConfig()$get('multival.field.sep')
    x7 <- biodb$addColsToDataframe(idf, id.col='ids', db=conn$getId(), limit=2,
                                    fields=c('formula', 'msprecmz'))
    y7 <- cbind(idf, data.frame(formula=c("C6H12O6", "C6H8O7"),
                                msprecmz=c(90, paste(c(100, 110), collapse=sep)),
                                stringsAsFactors=FALSE))
    testthat::expect_identical(y7, x7)

    # Delete connector
    biodb$getFactory()$deleteConn(conn$getId())
}

test.entriesToSingleFieldValues <- function(biodb) {

    # Create database
    db <- data.frame(
        accession=c("A1", "A2", "A3", "A3", "A3"),
        formula=c("C3H10N2", "C6H8O7", "C6H8O7", "C6H8O7", "C6H8O7"),
        msprecmz=c(100, 90, 100, 110, 120),
        stringsAsFactors=FALSE)

    # Create connector
    conn <- biodb$getFactory()$createConn('mass.csv.file')
    conn$setDb(db)
    
    # Get IDs & entries
    ids <- conn$getEntryIds()
    testthat::expect_length(ids, 3)
    entries <- conn$getEntry(ids)
    testthat::expect_length(entries, 3)

    # Test
    formulae <- biodb$entriesToSingleFieldValues(entries, field='formula')
    testthat::expect_identical(db$formula[ ! duplicated(db$formula)], formulae)
    formulae <- biodb$entriesToSingleFieldValues(entries, field='formula',
                                                  uniq=FALSE)
    testthat::expect_identical(c("C3H10N2", "C6H8O7", "C6H8O7"), formulae)
    formulae <- biodb$entriesToSingleFieldValues(entries, field='formula',
                                                  sort=TRUE)
    testthat::expect_identical(sort(db$formula[ ! duplicated(db$formula)]),
                               formulae)
    formulae <- biodb$entriesToSingleFieldValues(entries, field='msprecmz')
    testthat::expect_identical(db$msprecmz[ ! duplicated(db$msprecmz)],
                               formulae)
    
    # Delete connector
    biodb$getFactory()$deleteConn(conn$getId())
}

test.entryIdsToSingleFieldValues <- function(biodb) {

    # Create database
    db <- data.frame(
        accession=c("A1", "A2", "A3", "A3", "A3"),
        formula=c("C3H10N2", "C6H8O7", "C6H8O7", "C6H8O7", "C6H8O7"),
        msprecmz=c(100, 90, 100, 110, 120),
        stringsAsFactors=FALSE)

    # Create connector
    conn <- biodb$getFactory()$createConn('mass.csv.file')
    conn$setDb(db)
    
    # Get IDs
    ids <- conn$getEntryIds()
    testthat::expect_length(ids, 3)

    # Test
    formulae <- biodb$entryIdsToSingleFieldValues(ids, db=conn$getId(),
                                                  field='formula')
    testthat::expect_identical(db$formula[ ! duplicated(db$formula)], formulae)
    formulae <- biodb$entryIdsToSingleFieldValues(ids, db=conn$getId(),
                                                  field='formula', uniq=FALSE)
    testthat::expect_identical(c("C3H10N2", "C6H8O7", "C6H8O7"), formulae)
    formulae <- biodb$entryIdsToSingleFieldValues(ids, db=conn$getId(),
                                                  field='formula', sort=TRUE)
    testthat::expect_identical(sort(db$formula[ ! duplicated(db$formula)]),
                               formulae)
    formulae <- biodb$entryIdsToSingleFieldValues(ids, db=conn$getId(),
                                                  field='msprecmz')
    testthat::expect_identical(db$msprecmz[ ! duplicated(db$msprecmz)],
                               formulae)

    # Delete connector
    biodb$getFactory()$deleteConn(conn$getId())
}

test.entriesFieldToVctOrLst <- function(biodb) {

    # Create database
    db <- data.frame(
        accession=c("A1", "A1", "A1", "A1", "A1"),
        msprecmz=c(80, 90, 100, 110, 120),
        stringsAsFactors=FALSE)

    # Create connector
    conn <- biodb$getFactory()$createConn('mass.csv.file')
    conn$setDb(db)

    # Get entry
    entry <- conn$getEntry("A1")
    testthat::expect_is(entry, "BiodbEntry")

    # Test
    v <- biodb$entriesFieldToVctOrLst(list(entry), field='msprecmz')
    testthat::expect_true(length(v[[1]]) == length(db$msprecmz))
    v <- biodb$entriesFieldToVctOrLst(list(entry), field='msprecmz', limit=3)
    testthat::expect_true(length(v[[1]]) == 3)

    # Delete connector
    biodb$getFactory()$deleteConn(conn$getId())
}

test.entriesToDataframe.noPeaksDuplication <- function(biodb) {
    fileUrl <- system.file("extdata", "massbank_extract_full.tsv",
                           package="biodb")
    conn <- biodb$getFactory()$createConn('mass.csv.file', url=fileUrl)
    testthat::expect_is(conn, 'MassCsvFileConn')
    entries <- conn$getEntry(c('AU200952', 'AU200953'))
    x <- biodb$entriesToDataframe(entries, only.atomic=FALSE, compute=TRUE,
                                  flatten=FALSE, limit=0)
    testthat::expect_false(any(duplicated(x[, c('accession', 'peak.mztheo')])))
    biodb$getFactory()$deleteConn(conn)
}

# Instantiate Biodb
biodb <- biodb::createBiodbTestInstance()

# Set context
biodb::testContext("Test BiodbMain instance.")

# Run tests
biodb::testThat("convertEntryIdFieldToDbClass() works correctly.",
                test.convertEntryIdFieldToDbClass, biodb=biodb)
biodb::testThat('collapseRows() works correctly.', test.collapseRows,
                biodb=biodb)
biodb::testThat("entriesToDataframe() works correctly.",
                test.entriesToDataframe, biodb=biodb)
biodb::testThat("entriesToDataframe() handles list of list in input.",
                test.entriesToDataframe.listOfListInput, biodb=biodb)
biodb::testThat("entriesToDataframe() does not duplicate peaks.",
                test.entriesToDataframe.noPeaksDuplication, biodb=biodb)
biodb::testThat("entryIdsToDataframe() works correctly.",
                test.entryIdsToDataframe, biodb=biodb)
biodb::testThat("entryIdsToDataframe() handles list of list in input.",
                test.entryIdsToDataframe.listOfListInput, biodb=biodb)
biodb::testThat("addColsToDataframe() works correctly.",
                test.addColsToDataframe, biodb=biodb)
biodb::testThat("entriesToSingleFieldValues() works correctly.",
                test.entriesToSingleFieldValues, biodb=biodb)
biodb::testThat("entryIdsToSingleFieldValues() works correctly.",
                test.entryIdsToSingleFieldValues, biodb=biodb)
biodb::testThat("entriesFieldToVctOrLst() works correctly.",
                test.entriesFieldToVctOrLst, biodb=biodb)

# Terminate Biodb
biodb$terminate()
