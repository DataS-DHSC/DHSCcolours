#' DHSC colour palettes
#'
#' Returns a character vector containing hex colours based on the colour palette
#' requested
#' @param theme string; current option is only "ohid"
#' @param n number; number of colours required
#' @param names logical; TRUE will return a named character vector
#' @export
#' @name brewer_dhsc
#' @title DHSC colour palettes
#' @examples
#' library(ggplot2)
#' library(DHSCcolours)
#'
#' categories <- c("Car", "Bike", "Horse", "Running")
#' df <- data.frame(category = categories,
#'                  value = runif(4))
#'
#' pal <- brewer_dhsc(theme = "ohid",
#'                    n = 4)
#' p <- ggplot(df, aes(x = category, y = value)) +
#'         geom_col(aes(fill = category)) +
#'         labs(title = "Methods of transport") +
#'         theme_minimal() +
#'         scale_fill_manual(values = pal)
#' p
#'
#' ## OR
#'
#' pal <- brewer_dhsc(theme = "ohid",
#'                    names = TRUE)
#' pal <- pal[c("DHSC teal", "red", "maroon", "purple")]
#' names(pal) <- categories
#' p <- ggplot(df, aes(x = category, y = value)) +
#'         geom_col(aes(fill = category)) +
#'         labs(title = "Methods of transport") +
#'         theme_minimal() +
#'         scale_fill_manual(values = pal)
#' p
brewer_dhsc <- function(theme = "dhsc", n = Inf, names = FALSE)
{

  colour_key  <- list(
    dhsc = unname(mapply(c, dhsc_colours())),
    ohid = unname(mapply(c, dhsc_colours()))
  )
  brewer_names <- list(
    dhsc = names(mapply(c, dhsc_colours())),
    ohid = names(mapply(c, dhsc_colours()))
  )

  brewer_names <- lapply(brewer_names, gsub, pattern = "dhsc_", replacement = "")

  if (!(theme %in% names(colour_key))) {
    stop("theme not in available pre-loaded palettes")
  }
  brewer_dhsc <- colour_key[[theme]]
  if (names == TRUE) {
    brewer_names <- brewer_names[[theme]]
    names(brewer_dhsc) <- brewer_names
  }
  if (length(n) > 1) stop("n must have length of 1")
  if (n == Inf) {
    brewer_dhsc <- brewer_dhsc
  } else if (n > length(brewer_dhsc)) {
    warning(paste("warning,",
                  n,
                  "colours requested but only",
                  length(brewer_dhsc),
                  "available.",
                  length(brewer_dhsc),
                  "colours returned."))
  } else if (n < 1) {
    stop("n must be positive")
  } else {
    brewer_dhsc <- brewer_dhsc[1:n]
  }

  return(brewer_dhsc)
}
# Deprecated functions ----------------------------------------------------

#' phe colour palettes
#'
#' Returns a character vector containing hex colours based on the colour palette
#' requested
#' @param theme string; current option is only "phe"
#' @param n number; number of colours required
#' @param names logical; TRUE will return a named character vector
#' @export
#' @name brewer_phe
#' @title PHE colour palettes
#' @examples
#' library(ggplot2)
#' library(DHSCcolours)
#'
#' categories <- c("Car", "Bike", "Horse", "Running")
#' df <- data.frame(category = categories,
#'                  value = runif(4))
#'
#' pal <- brewer_phe("phe", 4)
#' p <- ggplot(df, aes(x = category, y = value)) +
#'         geom_col(aes(fill = category)) +
#'         labs(title = "Methods of transport") +
#'         scale_fill_manual(values = pal)
#' p
#'
#' ## OR
#'
#' pal <- brewer_phe(names = TRUE)
#' pal <- pal[c("navy","coolgrey","yellow","grass")]
#' names(pal) <- categories
#' p <- ggplot(df, aes(x = category, y = value)) +
#'         geom_col(aes(fill = category)) +
#'         labs(title = "Methods of transport") +
#'         scale_fill_manual(values = pal)
#' p
brewer_phe <- function(theme = "phe", n = Inf, names = FALSE)
{

  warning("brewer_phe() will be deprecated soon and replaced by brewer_dhsc(theme = 'ohid')")
  colour_key  <- list(
    phe = c("#822433", "#00B092", "#002776",  "#DAD7CB",
            "#A4AEB5", "#E9994A", "#EAAB00", "#00A551", "#8CB8C6",
            "#00549F", "#532D6D", "#C51A4A"))
  brewer_names <- list(
    phe = c("PHEred", "teal", "navy", "mushroom", "coolgrey",
            "peach", "yellow", "grass", "sky", "moonlight", "plum",
            "rose")
  )
  if (!(theme %in% names(colour_key))) {
    stop("name not in available pre-loaded palettes")
  }
  brewer_phe <- colour_key[[theme]]
  if (names == TRUE) {
    brewer_names <- brewer_names[[theme]]
    names(brewer_phe) <- brewer_names
  }
  if (length(n) > 1) stop("n must have length of 1")
  if (n == Inf) {
    brewer_phe <- brewer_phe
  } else if (n > length(brewer_phe)) {
    warning(paste("warning,",
                  n,
                  "colours requested but only",
                  length(brewer_phe),
                  "available.",
                  length(brewer_phe),
                  "colours returned."))
  } else if (n < 1) {
    stop("n must be positive")
  } else {
    brewer_phe <- brewer_phe[1:n]
  }

  return(brewer_phe)
}
