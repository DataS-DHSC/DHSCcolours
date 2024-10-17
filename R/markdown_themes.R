#' Convert your markdown documents to OHID brand
#' @param toc logical; whether to include a table of contents
#' @param includes Named list of additional content to include within the
#'  document (typically created using the includes function from rmarkdown
#'  package).
#' @param ... other arguments to pass to html_document()
#' @family document template
#' @importFrom rmarkdown html_document
#' @export
#' @name html_ohid
#' @title OHID-branded html documents
html_ohid <- function(toc = FALSE,
                     includes = NULL, ...) {
        css <- system.file("templates/html_ohid.css", package = "DHSCcolours")
        rmarkdown::html_document(toc = toc,
                                 #toc_float = toc_float,
                                 fig_width = 7.5,
                                 fig_height = 4,
                                 #theme = theme,
                                 css = css,
                                 includes = includes,
                                 ...)
}
