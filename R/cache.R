#' Get cache
#'
#' \code{.getCache} creates and loads a local cache for the `ete3r`
#' package.
#'
#' @return
#' A BiocFileCache object.
#'
#' @importFrom tools R_user_dir
#' @importFrom BiocFileCache BiocFileCache
#'
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' cache <- .getCache()
#' cache
#'
#' }
#'
#'
.getCache <- function() {
    tools::R_user_dir(package = "ete3r", which = "cache") |>
        BiocFileCache::BiocFileCache(ask = FALSE)
}
