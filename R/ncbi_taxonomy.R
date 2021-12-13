
#' Get NCBI tree
#'
#' \code{getTree} returns an annotated phylogenetic tree from
#' NCBI IDs (taxids) based on the NCBI taxonomy.
#'
#' This is a wraper around the ete3 package
#' \url{http://etetoolkit.org/docs/latest/tutorial/tutorial_ncbitaxonomy.html}.
#'
#' @param taxids Integer vector of NCBI IDs (taxids).
#'
#' @return A phylogenetic tree (tidytree class object).
#'
#' @importFrom basilisk basiliskStart
#' @importFrom basilisk basiliskStop
#' @importFrom basilisk basiliskRun
#' @importFrom reticulate import
#' @importFrom treeio read.nhx
#'
#' @export
#'
#' @examples
#'
#' \dontrun{
#'
#' taxids <- c(9606, 9598, 10090, 7707, 8782)
#' tree <- getTree(taxids)
#' class(tree)
#'
#' }
#'
getTree <- function(taxids) {

    proc <- basilisk::basiliskStart(ETE3Env)
    on.exit(basilisk::basiliskStop(proc))

    tree <- basilisk::basiliskRun(proc, function(TAXIDS) {
        ete3 <- reticulate::import("ete3")
        ncbi <- ete3$NCBITaxa()
        tree <- ncbi$get_topology(
            taxids = taxids, intermediate_nodes = FALSE, annotate = TRUE
        )
        tree$resolve_polytomy(recursive = TRUE)
        tree_file <- tempfile()
        tree$write(
            outfile = tree_file,
            format = 2,
            features = list("name", "rank", "sci_name", "taxid")
        )
        tree_text <- readr::read_file(tree_file)
        tree_text <- gsub(" ", "_", tree_text)
        readr::write_file(tree_text, tree_file)
        output_tree <- treeio::read.nhx(tree_file)
        output_tree
    }, TAXIDS = taxids)

    tree
}

