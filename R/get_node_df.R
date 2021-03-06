#' Get a node data frame from a graph
#' @description From a graph, obtain a node data frame
#' with all current node attributes.
#' @param graph a graph object of class
#' \code{dgr_graph} that is created using
#' \code{create_graph}.
#' @return a node data frame.
#' @examples
#' \dontrun{
#' library(magrittr)
#'
#' # Create a graph using several piped functions
#' graph <-
#'   create_graph() %>%
#'   add_n_nodes(1, "a") %>%
#'   select_last_node %>%
#'   add_n_nodes_from_selection(5, "b") %>%
#'   select_nodes_by_id(1) %>%
#'   set_node_attr_with_selection(
#'     "value", 25.3) %>%
#'   clear_selection %>%
#'   select_nodes_by_id(2:4) %>%
#'   set_node_attr_with_selection(
#'     "color", "grey70") %>%
#'   invert_selection %>%
#'   set_node_attr_with_selection(
#'     "color", "grey80") %>%
#'   clear_selection %>%
#'   select_nodes("value", "<15") %>%
#'   set_node_attr_with_selection(
#'     "value", 10.0) %>%
#'   clear_selection
#'
#' # Get the graph's internal node data frame (ndf)
#' graph %>% get_node_df
#' #> nodes type label value  color
#' #> 1     1    a        25.3 grey80
#' #> 2     2    b          10 grey70
#' #> 3     3    b          10 grey70
#' #> 4     4    b          10 grey70
#' #> 5     5    b          10 grey80
#' #> 6     6    b          10 grey80
#' }
#' @export get_node_df

get_node_df <- function(graph) {

  if (is.null(graph$nodes_df)) {
    return(NA)
  } else {
    return(graph$nodes_df)
  }
}
