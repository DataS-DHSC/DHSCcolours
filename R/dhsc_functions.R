# Functions

#' dhsc_white
#' The colour code for DHSC white
#' @return
#' @export
dhsc_white <- function() {
  "#ffffff"
}


#' dhsc_black
#' The colour code for DHSC black
#' @return
#' @export
dhsc_black <- function() {
  "#101820"
}

#' dhsc_primary
#' The colour code for the DHSC primary colour.
#' @return
#' @export
dhsc_primary <- function() {
  "#00ad93"
}

#' dhsc_grey
#' The colour code for DHSC grey
#' @return
#' @export
dhsc_grey <- function() {
  "#616265"
}

#' dhsc_red
#' The colour code for DHSC red
#' @return
#' @export
dhsc_red <- function() {
  "#cc092f"
}

#' dhsc_orange
#' The colour code for DHSC orange
#' @return
#' @export
dhsc_orange <- function() {
  "#e57200"
}

#' dhsc_burgendy
#' The colour code for DHSC burgendy
#' @return
#' @export
dhsc_burgendy <- function() {
  "#8b2346"
}

#' dhsc_light_blue
#' The colour code for DHSC light blue
#' @return
#' @export
dhsc_light_blue <- function() {
  "#34b6e4"
}

#' dhsc_dark_blue
#' The colour code for DHSC dark blue
#' @return
#' @export
dhsc_dark_blue <- function() {
  "#0063be"
}

#' dhsc_light_green
#' The colour code for DHSC light green.
#' @return
#' @export
dhsc_light_green <- function() {
  "#2eb135"
}

#' dhsc_dark_green
#' The colour code for DHSC dark green.
#' @return
#' @export
dhsc_dark_green <- function() {
  "#006652"
}

#' dhsc_yellow
#' The colour code for DHSC yellow
#' @return
#' @export
dhsc_yellow <- function() {
  "#ecac00"
}

#' dhsc_pink
#' The colour code for DHSC pink
#' @return
#' @export
dhsc_pink <- function() {
  "#cd66cc"
}

#' dhsc_purple
#' The colour code for DHSC purple
#' @return
#' @export
dhsc_purple <- function() {
  "#512698"
}


#' @title dhsc_colours
#' @description A named list of all the "official" DHSC colours.
#' @return A named list
#' @export
#'
#' @examples dhsc_colours()
dhsc_colours <- function() {
  list(
    dhsc_primary = "#00ad93",
    dhsc_light_blue = "#34b6e4",
    dhsc_dark_blue = "#0063be",
    dhsc_light_green = "#2eb135",
    dhsc_dark_green = "#006652",
    dhsc_yellow = "#ecac00",
    dhsc_orange = "#e57200",
    dhsc_burgendy = "#8b2346",
    dhsc_red = "#cc092f",
    dhsc_pink = "#cd66cc",
    dhsc_purple = "#512698"
  )
}


#' @title dhsc_bw
#' @description A named list of all the "official" DHSC black, white and grey.
#' @return A named list
#' @export
#'
#' @examples dhsc_colours()
dhsc_bw <- function() {
  list(
    dhsc_black = "#101820",
    dhsc_grey = "#616265",
    dhsc_white = "#ffffff"
  )
}


#' @title  dhsc_pal
#' @description This function creates a vector of n equally spaced colors along
#' the list of DHSC colours. Reordering the list will change the colours it
#' generates. The code is based on the virids function from viridislite.
#'
#' @param n The number of colors (\eqn{\ge 1}) to be in the palette.
#'
#' @param alpha	The alpha transparency, a number in [0,1], see argument alpha in
#' \code{\link[grDevices]{hsv}}.
#'
#' @param begin The (corrected) hue in [0,1] at which the viridis colormap begins.
#'
#' @param end The (corrected) hue in [0,1] at which the viridis colormap ends.
#'
#' @param direction Sets the order of colors in the scale. If 1, the default, colors
#' are ordered from darkest to lightest. If -1, the order of colors is reversed.
#'
#' @return
#' @export
#'
#' @examples dhsc_pal(2)
dhsc_pal <- function(n, alpha = 1, begin = 0, end = 1, direction = 1) {
  if (begin < 0 | begin > 1 | end < 0 | end > 1) {
    stop("begin and end must be in [0,1]")
  }

  if (abs(direction) != 1) {
    stop("direction must be 1 or -1")
  }

  if (direction == -1) {
    tmp <- begin
    begin <- end
    end <- tmp
  }



  fn_cols <- grDevices::colorRamp(dhsc_colours(), space = "Lab", interpolate = "spline")
  cols <- fn_cols(seq(begin, end, length.out = n)) / 255
  grDevices::rgb(cols[, 1], cols[, 2], cols[, 3], alpha = alpha)
}



#' @title scale_colour_dhsc_d
#' Use the DHSC discrete colour scale.
#'
#' @param ... Other arguments passed on to [discrete_scale()]
#' @param alpha	The alpha transparency, a number in [0,1], see argument alpha in
#' \code{\link[grDevices]{hsv}}.
#'
#' @param begin The (corrected) hue in [0,1] at which the viridis colormap begins.
#'
#' @param end The (corrected) hue in [0,1] at which the viridis colormap ends.
#'
#' @param direction Sets the order of colors in the scale. If 1, the default, colors
#' are ordered from darkest to lightest. If -1, the order of colors is reversed.
#'
#' @param aesthetics Character string or vector of character strings listing the
#'  name(s) of the aesthetic(s) that this scale works with. This can be useful,
#'  for example, to apply colour settings to the colour and fill aesthetics at
#'  the same time, via [aesthetics = c("colour", "fill")].
#'
#' @export
#'

scale_colour_dhsc_d <- function(..., alpha = 1, begin = 0, end = 1,
                                direction = 1, aesthetics = "colour") {
  dhsc_pal_2 <- function(alpha = 1, begin = 0, end = 1, direction = 1) {
    force_all <- function(...) list(...)

    force_all(alpha, begin, end, direction)
    function(n) {
      dhsc_pal(n, alpha, begin, end, direction)
    }
  }

  ggplot2::discrete_scale(
    aesthetics,
    "dhsc_d",
    dhsc_pal_2(alpha, begin, end, direction),
    ...
  )
}

#' @title scale_fill_dhsc_d
#' Use the DHSC discrete fill scale.
#'
#' @param ... Other arguments passed on to [discrete_scale()]
#' @param alpha	The alpha transparency, a number in [0,1], see argument alpha in
#' \code{\link[grDevices]{hsv}}.
#'
#' @param begin The (corrected) hue in [0,1] at which the viridis colormap begins.
#'
#' @param end The (corrected) hue in [0,1] at which the viridis colormap ends.
#'
#' @param direction Sets the order of colors in the scale. If 1, the default, colors
#' are ordered from darkest to lightest. If -1, the order of colors is reversed.
#'
#' @param aesthetics Character string or vector of character strings listing the
#'  name(s) of the aesthetic(s) that this scale works with. This can be useful,
#'  for example, to apply colour settings to the colour and fill aesthetics at
#'  the same time, via [aesthetics = c("colour", "fill")].
#' @export
#'
scale_fill_dhsc_d <- function(..., alpha = 1, begin = 0, end = 1,
                              direction = 1, aesthetics = "fill") {
  dhsc_pal_2 <- function(alpha = 1, begin = 0, end = 1, direction = 1) {
    force_all <- function(...) list(...)

    force_all(alpha, begin, end, direction)
    function(n) {
      dhsc_pal(n, alpha, begin, end, direction)
    }
  }

  ggplot2::discrete_scale(
    aesthetics,
    "dhsc_d",
    dhsc_pal_2(alpha, begin, end, direction),
    ...
  )
}

#' @title scale_colour_dhsc_c
#' Use a continuous colour scale from DHSC green to purple.
#'
#' @export
#'
scale_colour_dhsc_c <- function() {
  ggplot2::scale_colour_gradient(low = dhsc_primary(), high = dhsc_purple())
}

#' @title scale_fill_dhsc_c
#' Use a continuous colour scale from DHSC green to purple.
#'
#' @export
#'
scale_fill_dhsc_c <- function() {
  ggplot2::scale_fill_gradient(low = dhsc_primary(), high = dhsc_purple())
}

#' @title scale_colour_dhsc_red_green_c
#' @description Use a continuous colour scale from DHSC green to red.
#' @export
#'
scale_colour_dhsc_red_green_c <- function() {
  ggplot2::scale_colour_gradient(low = dhsc_primary(), high = dhsc_red())
}


#' @title scale_fill_dhsc_red_green_c
#' @description Use a continuous fill scale from DHSC green to red.
#' @export
#'
scale_fill_dhsc_red_green_c <- function() {
  ggplot2::scale_fill_gradient(low = dhsc_primary(), high = dhsc_red())
}


#' @title scale_colour_dhsc_blue_green
#' @description Use a continuous colour scale from DHSC blue to green.
#' @export
#'
scale_colour_dhsc_blue_green_c <- function() {
  ggplot2::scale_colour_gradient(low = dhsc_dark_blue(), high = dhsc_primary())
}

#' @title scale_fill_dhsc_blue_green
#' @description Use a continuous fill scale from DHSC blue to green.
#' @export
#'
scale_fill_dhsc_blue_green_c <- function() {
  ggplot2::scale_fill_gradient(low = dhsc_dark_blue(), high = dhsc_primary())
}

#' @title scale_colour_dhsc_blue_yellow
#' @description Use a continuous colour scale from DHSC blue to yellow
#' @export
#'
scale_colour_dhsc_blue_yellow_c <- function() {
  ggplot2::scale_colour_gradient(low = dhsc_dark_blue(), high = dhsc_yellow())
}

#' @title scale_fill_dhsc_blue_yellow
#' @description Use a continuous fill scale from DHSC blue to yellow
#' @export
#'
scale_fill_dhsc_blue_yellow_c <- function() {
  ggplot2::scale_fill_gradient(low = dhsc_dark_blue(), high = dhsc_yellow())
}

#' @title zero_y_padding
#' @description By default, ggplot introduces some padding around the data to
#' ensure that they are placed some distance away from the axes. This function
#' is a shortcut to remove that padding so that if the data start at 0, the y
#' axis intercept will also be zero.
#' @return
#' @export
#'
zero_y_padding <- function() {
  scale_y_continuous(expand = c(0, 0))
}


#' @title dhsc_table
#' @description For inserting consistent tables into rmarkdown documents. This
#' is just A wrapper for knitr::kable() in which the default alignment of
#' text within columns has been changed to be left-aligned.
#'
#' @param table_data An R object, which is typically a matrix or data frame.
#' @param ... Other arguments to pass to kable.
#'
#' @return
#' @export
#'
dhsc_table <- function(table_data, ...) {
  knitr::kable(table_data, align = "l", ...)
}







#' @title DHSC_accessible_3
#' @description An accessible 3 colour palette.
#' @return A list of three colours for a colour blind friendly palette.
#' @export
#'
DHSC_accessible_3 <- function() {
  c(dhsc_primary(), dhsc_orange(), dhsc_purple())
}


#' @title DHSC_accessible_4
#' @description An accessible 4 colour palette.
#' @return A list of four colours for a colour blind friendly palette.
#' @export
#'
DHSC_accessible_4 <- function() {
  c(dhsc_light_blue(), "#990723", dhsc_orange(), dhsc_purple())
}


#' @title DHSC_accessible_5
#' @description An accessible 5 colour palette.
#' @return A list of five colours for a colour blind friendly palette.
#' @export
#'
DHSC_accessible_5 <- function() {
  c("#512698", "#E57200", "#1A9CCB", "#2F4D14", "#D06DCE")
}


#' @title DHSC_accessible_5_gradient
#' @description An accessible 5 colour palette for ordinal data.
#' @return A list of five colours for a colour blind friendly palette.
#' @export
#'
DHSC_accessible_5_gradient <- function() {
  c("#294011", "#4C721D", "#589325", "#88D147", "#D7EFC3")
}


#' @title DHSC_accessible_scales
#' @description This function encodes ggplot color scales which are colour blind
#' friendly. It currently includes a 3, 4, and 5 colour option.
#' @param N The number of colours to use, either 3, 4, or 5
#' @param aesthetics Character string or vector of character strings listing the
#'  name(s) of the aesthetic(s) that this scale works with. This can be useful,
#'  for example, to apply colour settings to the colour and fill aesthetics
#'  at the same time, via aesthetics = c("colour", "fill").
#'
#' @return
#' @export
#'
DHSC_accessible_scales <-
  function(N, aesthetics = c("colour", "fill")) {
    if (N %in% c(3:5) == FALSE | !is.numeric(N)) {
      stop("N must be an integer from 3 to 5")
    }

    if (N == 3) {
      scale <-
        scale_fill_manual(values = DHSC_accessible_3(), aesthetics = aesthetics)
    }
    if (N == 4) {
      scale <-
        scale_fill_manual(values = DHSC_accessible_4(), aesthetics = aesthetics)
    }
    if (N == 5) {
      scale <-
        scale_fill_manual(values = DHSC_accessible_5(), aesthetics = aesthetics)
    }
    scale
  }




#' @title DHSC_accessible_gradient
#' @description This function encodes ggplot color scales which are colour blind
#' friendly. It currently includes a 5 colour option.
#' @param N The number of colours to use is 5
#' @param aesthetics Character string or vector of character strings listing the
#'  name(s) of the aesthetic(s) that this scale works with. This can be useful,
#'  for example, to apply colour settings to the colour and fill aesthetics
#'  at the same time, via aesthetics = c("colour", "fill").
#'
#' @return
#' @export
#'
DHSC_accessible_gradient <-
  function(N, aesthetics = c("colour", "fill")) {
    if (N %in% c(5:5) == FALSE | !is.numeric(N)) {
      stop("N must be an integer of 5")
    }
    if (N == 5) {
      scale <-
        scale_fill_manual(values = DHSC_accessible_5_gradient(), aesthetics = aesthetics)
    }
    scale
  }
