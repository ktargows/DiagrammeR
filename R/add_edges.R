#' Add one or more edges using a vector object
#' @description With a graph object of class
#' \code{dgr_graph}, add one or more edges to the graph
#' using a character vector.
#' @param graph a graph object of class
#' \code{dgr_graph} that is created using
#' \code{create_graph}.
#' @param edges a single-length vector with a character
#' string specifying the edges.
#' @param rel an optional vector specifying the
#' relationship between the connected nodes.
#' @return a graph object of class \code{dgr_graph}.
#' @examples
#' \dontrun{
#' library(magrittr)
#'
#' # Create a graph with 10 nodes
#' graph <-
#'   create_graph() %>%
#'   add_n_nodes(10)
#'
#' # Add edges between nodes using a character string
#' graph <-
#'   graph %>%
#'   add_edges("1->2 1->3 2->4 2->5 3->6 3->7 4->8 4->9 5->10")
#' }
#' @export add_edges

add_edges <- function(graph,
                      edges,
                      rel = NULL) {

  edges_split <-
    unlist(strsplit(edges, " "))

  from <-
    sapply(strsplit(edges_split, "->"), "[[", 1)

  to <-
    sapply(strsplit(edges_split, "->"), "[[", 2)

  new_edges <-
    create_edges(
      from = from,
      to = to)

  new_graph <-
    add_edge_df(graph,
                new_edges)

  return(new_graph)
}
