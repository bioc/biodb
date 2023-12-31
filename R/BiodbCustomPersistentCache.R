#' A biodb custom persistent cache implementation.
#'
#'
#' Inside the cache folder, one folder is created for each cache ID (each remote
#' database has one single cache ID, always the same ,except if you change its
#' URL). In each of theses folders are stored the cache files for this database.
#'
#' @seealso \code{\link{BiodbPersistentCache}},
#' \code{\link{BiodbBiocPersistentCache}}.
#'
#' @include BiodbPersistentCache.R
#' @export
BiodbCustomPersistentCache <- R6::R6Class('BiodbCustomPersistentCache',
inherit=BiodbPersistentCache,

public=list(
),

private=list(
doGetFilePath=function(cache.id, name, ext) {

    # Replace unwanted characters
    name <- gsub('[^A-Za-z0-9._-]', '_', name)

    # Set file path
    filepaths <- file.path(self$getFolderPath(cache.id),
        paste(name, ext, sep='.'))

    return(filepaths)
},

doFilesExist=function(cache.id) {
    return(length(Sys.glob(file.path(self$getFolderPath(cache.id), '*'))) > 0)
},

doFileExists=function(cache.id, name, ext) {
    return(file.exists(self$getFilePath(cache.id, name, ext)))
},

doAddFilesToCache=function(cache.id, src, name, ext, action) {

    # Get destination file paths
    dst <- self$getFilePath(cache.id, name, ext)

    # Move files
    logTrace('Destination files are %s.', lst2str(dst))
    if (action == 'move')
        file.rename(src, dst)
    else
        file.copy(src, dst)

    return(invisible(NULL))
},

doErase=function() {
},

doDeleteFile=function(cache.id, name, ext) {

    file.paths <- self$getFilePath(cache.id, name, ext)
    lapply(file.paths, unlink)
},

doDeleteAllFiles=function(cache.id) {
},

doListFiles=function(cache.id, pattern, full.path) {

    path <- self$getFolderPath(cache.id=cache.id)
    logDebug("List files in %s using pattern %s.", path, pattern)
    files <- list.files(path=path, pattern=pattern)

    # Set full path
    if (full.path)
        files <- file.path(path, files)
        
    return(files)
},

doSaveContentToFile=function(cache.id, content, name, ext) {

    # Get file paths
    file.paths <- self$getFilePath(cache.id, name, ext)

    # Write content to files
    logTrace('Saving to cache %s', lst2str(file.paths))
    saveContentsToFiles(file.paths, content)

    return(invisible(NULL))
}
))
