#' Split a string
#'
#' @param x A character vector of one element
#' @param split The separating character used to split x
#'
#' @returns The character vector
#' @export
#'
#' @examples
#' x <- "cat,dog,hamnster,rabbit"
#' strsplit1(x, ",")
str_split_one <- function(string, pattern, n = Inf) {
  stopifnot(is.character(string), length(string) <= 1)
  if (length(string) == 1) {
    stringr::str_split(string = string, pattern = pattern, n = n)[[1]]
  } else {
    character()
  }
}
