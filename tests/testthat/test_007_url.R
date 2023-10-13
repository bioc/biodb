test_getRCurlContent <- function() {
    content <- biodb:::getRCurlContent('https://www.ebi.ac.uk/webservices/chebi/2.0/test/getCompleteEntity?chebiId=17001')
    testthat::expect_is(content, 'character')
    testthat::expect_true(length(content) == 1)
    testthat::expect_true(nchar(content) > 0)
}

# Set context
biodb::testContext("Testing URL fcts.")

# Run tests
biodb::testThat("getRCurlContent() works fine.", test_getRCurlContent)
