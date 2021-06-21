#' Theme DHSC for ggplot
#'
#' @param base_size Base font size, given in pts.
#'
#' @export
#' @import dplyr
#' @import ggplot2
#' @examples
#'
#'  ggplot2::ggplot(dplyr::tibble(
#'  y = c(2, 4),
#'  x = c("A", "B")),
#'  ggplot2::aes(x = x, y = y, fill = x)) +
#'  ggplot2::geom_col() +
#'  theme_dhsc()
#'
theme_dhsc <- function(base_size = 12) {

  theme_foundation <- function(base_size=base_size) {
    thm <- theme_grey(base_size = base_size, base_family = "sans")
    for (i in names(thm)) {
      if ("colour" %in% names(thm[[i]])) {
        thm[[i]]["colour"] <- list(NULL)
      }
      if ("fill" %in% names(thm[[i]])) {
        thm[[i]]["fill"] <- list(NULL)
      }
    }
    thm + theme(panel.border = element_rect(fill = NA),
                legend.background = element_rect(colour = NA),
                line = element_line(colour = dhsc_grey()),
                rect = element_rect(fill = dhsc_white(), colour = dhsc_grey()),
                text = element_text(colour = dhsc_grey()))}


 (theme_foundation(base_size = base_size)
   + theme(rect = element_rect(colour = dhsc_grey(), fill = dhsc_white()),
           text = element_text(colour = dhsc_grey()),
           line = element_line(colour = dhsc_grey()),
           # 13 pt
           plot.title = element_text(size = rel(1.3)),
           legend.title = element_blank(),
           legend.text = element_text(size = rel(1)),
           axis.title = element_text(size = rel(1)),
           axis.line.x = element_line(colour = dhsc_grey()),
           axis.line.y = element_line(colour = dhsc_grey()),
           panel.border = element_rect(fill = NA, colour = dhsc_white()),
           panel.grid.minor = element_blank(),
           panel.grid.major.x = element_blank(),
           legend.position = "right",
           legend.direction = "vertical",
           legend.background = element_rect(colour = NA),
           legend.key = element_rect(colour = NA),
           axis.text.x = element_text(angle = 45, hjust = 1),
           plot.background = element_blank()))




}


