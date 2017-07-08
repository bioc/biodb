Biodb
=====

An R package for connecting to chemical and biological databases.

With *biodb* you can:

 * Access entries by accession number and let *biodb* download them for you.
 * Take advantage of the cache system, that saves the results of all sent requests for you. If you send again the same request, the cached result will be used instead of contacting the database. The cache system can be disabled.
 * Download whole databases and access entries by accession number locally.
 * Rely on *biodb* to access correctly the database, respecting the published access policy (i.e.: not sending too much requests). *biodb* uses a special class for scheduling requests on each database.
 * Switch from one database to another easily (providing they offer the same type of information), not changing a line in your code. This is because entries are populated with values found from the database, using always the same keys.
 * Search for MS spectra by peaks in Massbank, Peakforest and in-house database.
 * Search for MSMS spectra.
 * Export any database into a CSV file.

## Examples

In this section, you can find some of the possibilities offered by the *biodb* package.
More examples, explained and detailed, can be found in the package's vignettes.

### Retrieve some entries from a database

```r
# Create a Biodb instance
mybiodb <- biodb::Biodb$new()

# Request entries from ChEBI, using accession numbers
entries <- mybiodb$getFactory()$getEntry('chebi', id = c('2528', '17053', '15440'))

# Get the SMILES of those entries 
smiles <- vapply(entries, function(e) e$getFieldValue('smiles'), FUN.VALUE = '')
```

### Exporting a database into a CSV file

```r
# Create a Biodb instance
mybiodb <- biodb::Biodb$new()

# Get all entry IDs of Mirbase Mature.
entry.ids <- mybiodb$getFactory()$getConn('mirbase.mature')$getEntryIds()

# Get all Mirbase entries
entries <- mybiodb$getFactory()$getEntry('mirbase.mature', id = entry.ids)

# Transform all entries into a single data frame
df <- mybiodb$entriesToDataframe(entries)

# Export the data frame into a CSV file with R standard function
write.csv(df, file = 'mirbase-mature.csv')
```

### Search for LCMS spectra

```r
```

### Search for MSMS spectra

## Installation

### Install from GitLab

GitLab is the repository used for current developments.

Using packages `devtools`, `git2r` and `getPass`, you can install from GitLab repository:
```r
devtools::install_git("https://gitlab.com/proger/biodb.git", branch='develop', credentials=git2r::cred_user_pass ("your_login", getPass::getPass()))
```

### Install from GitHub

Using package `devtools` you can install Biodb directly from GitHub:
```r
devtools::install_github('pierrickrogermele/biodb')
```

### Install from local repository

First, you need to clone the GitLab repos:
```bash
git clone https://gitlab.com/proger/biodb.git
```

Then you install *biodb* using the `devtools` package:
```r
devtools::install_local('/your/path/to/biodb')
```

## Contributing

 TODO How to contribute: GitLab repos.

### Running tests

 TODO How to run test with `make`.
