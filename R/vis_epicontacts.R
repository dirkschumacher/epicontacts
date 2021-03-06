#' Plot epicontacts objects using visNetwork
#'
#' This function plots \code{\link{epicontacts}} objects using the
#' \code{visNetwork} package.
#'
#' @export
#'
#'
#' @author 
#' Thibaut Jombart (\email{thibautjombart@@gmail.com})
#' VP Nagraj (\email{vpnagraj@@virginia.edu})
#'
#' @param x An \code{\link{epicontacts}} object.
#'
#' @param group An index or character string indicating which field of the
#'     linelist should be used to color the nodes.
#'
#' @param annot An index or character string indicating which fields of the
#'     linelist should be used for annotating the nodes.
#'
#' @param legend A logical indicating whether a legend should be added to the plot.
#'
#' @param legend_max The maximum number of groups for a legend to be displayed.
#'
#' @param col_pal A color palette for the groups.
#'
#' @param NA_col The color used for unknown group.
#'
#' @param width The width of the output, in html compatible format (e.g. '90\%'
#'     or '800px').
#'
#' @param height The height of the output, in html compatible format (e.g. '800px').
#'
#' @param selector A logical indicating if the selector tool should be used;
#'     defaults to TRUE.
#'
#' @param editor A logical indicating if the editor tool should be used;
#'     defaults to FALSE.
#'
#' @param ... Further arguments to be passed to \code{visNetwork}.
#'
#'
#' @importFrom magrittr "%>%"
#'
#' @return The same output as \code{visNetwork}.
#'
#' @seealso \code{\link[visNetwork]{visNetwork}} in the package \code{visNetwork}.
#'
#' @examples
#' if (require(outbreaks)) {
#'
#' ## example using MERS outbreak in Korea, 2014
#' head(mers.korea.2015[[1]])
#' head(mers.korea.2015[[2]])
#'
#' x <- make_epicontacts(linelist=mers.korea.2015[[1]],
#'                        contacts = mers.korea.2015[[2]],
#'                        directed=TRUE)
#'
#' \dontrun{
#' plot(x)
#' plot(x, group = "place_infect")
#' plot(x, group = "loc_hosp", legend_max=20, annot=TRUE)
#' }
#' }
vis_epicontacts <- function(x, group = "id", annot  =  TRUE,
                             legend = TRUE, legend_max = 10,
                             col_pal = cases_pal, NA_col = "lightgrey",
                             width = "90%", height = "700px",
                             selector = TRUE, editor = FALSE,
                             ...){

      ## make visNetwork inputs: nodes
    nodes <- data.frame(id = unique(c(x$linelist$id,
                                      x$contacts$from,
                                      x$contacts$to)))
      nodes$label <- nodes$id
      ## join back to linelist to retrieve attributes for grouping
    nodes <- suppressMessages(
        suppressWarnings(dplyr::left_join(nodes,x$linelist)))
      nodes$group <- as.character(nodes[,group])
      nodes$group[is.na(nodes$group)] <- "NA"
      nodes$group <- factor(nodes$group)
      
      ## get annotations
      temp <- nodes[, annot, drop=FALSE]
      temp <- sapply(names(temp), function(e) paste(e, temp[,e], sep=": "))
      nodes$title <- paste("<p>", apply(temp, 1, paste0, collapse="<br>"), "</p>")
      
      ## make visNetwork inputs: edges
      edges <- x$contacts
      if (x$directed) {
        edges$arrows <- "to"
      }
      
      ## OUTPUT
      
      ## visNetwork output
      out <- visNetwork::visNetwork(nodes, edges,
        width=width, height=height, ...)
      
      ## add group info/color
      K <- length(unique(nodes$group))
      grp.col <- col_pal(K)
      grp.col[levels(nodes$group)=="NA"] <- NA_col
      for(i in seq_len(K)){
          out <- out %>% visNetwork::visGroups(groupname = levels(nodes$group)[i],
                                               color = grp.col[i])
      }
      
      ## add legend
     if (legend && K<legend_max) {
        out <- out %>% visNetwork::visLegend()
      }
      
      ## set nodes borders
      out <- out %>% visNetwork::visNodes(borderWidth=2)
      
      ## options
      out <- out %>% visNetwork::visOptions(highlightNearest=TRUE)
      
      if (selector) {
        out <- out %>% visNetwork::visOptions(selectedBy=group,
          manipulation=editor, highlightNearest=list(enabled = TRUE))
      } else if (editor) {
        out <- out %>% visNetwork::visOptions(manipulation=TRUE,
          highlightNearest=list(enabled = TRUE))
    }
      
    return(out)
}
