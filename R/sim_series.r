#' @title  sim_series
#' @description Generates dummy data for experimenting with plots. User specifies
#' the number of rows to generate and receives a tibble with three columns. A
#' character vector with unique values, the row number, and the row number squared.
#' @param N The number of rows to simulate
#'
#' @return A tibble of simulated data.
#' @export
#'
#' @examples
#' sim_series(5)
sim_series <- function(N = 1){
  letter_df<-expand.grid(LETTERS,c(1:N))
  df = dplyr::tibble(X = paste(letter_df[,1],letter_df[,2],sep = "_"),
                     Y = seq_along(X),
                     Z = Y^2)
  df[1:N,]
}








