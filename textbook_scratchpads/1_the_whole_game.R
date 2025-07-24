x <- "cat,dog,hamnster,rabbit"

strsplit(x, split=",")
# by default strsplit returns the output as a list, which is handy for vectorisation
# but doesn't feel right

# so let's make a variant that matches our intuition

strsplit1 <- function(x, split) {
  strsplit(x, split = split)[[1]]
}

strsplit1(x, ",")

# where should we put this?
# for the time being, it makes sense to do it in R/, although in future we
# will probably want to group them

usethis::use_r("strsplit1") # overkill right now, but useful once we have more...
# funcs and start testing

# load_all() will load a package, including source everything in R/
# think of it as a local version of library()
# so, lmao, if you put /this/ file in R/, you'll get stuck in a loop
devtools::load_all()
# load_all() makes functions avaiable, but /doesn't/ add them to the global environment?
exists("strsplit1", where = globalenv(), inherits = FALSE)
# but because the package is loaded, R knows where to find them?

# once we've loaded our package, we might want to check if it works?
devtools::check()
# check builds and checks. we want to run it often if we're making lots of changes
# it's rather slow and "voluminous"
# according to the textbook it's meant to return 1 warning at this point, but instead
# we get 0 warnings and 3 notes (about difficulties writing temp files?)

# DESCRIPTION
# We can add some metadata to DESCRIPTION just text editing
# and we can add licenses like this
usethis::use_mit_license()

# Function documentation
# Add a skelington by clicking inside a function then Ctrl + Alt + Shift + R
# Once we've written it up, we can convert it to an .Rd file (which R will
# automatically use in function help text
devtools::document() # calls roxygen2::roxygenise()
?strsplit1 # shows preview/draft documentation - won't be all squared away until we
# build the package
# the void @export tag in strsplit1's documentation also adds it to NAMESPACE when we call document()

# Check again
devtools::check()
# still 0e 0w 1n

# The real deal: install()
devtools::install() # can also use ctrl + shift + b
# * installing to library 'C:/Users/sawel/AppData/Local/R/win-library/4.5'
# so it's now in our win-library folder,  and we can attach with library() like any other package
library(regexcite)

# Testing
# Is a very good idea
usethis::use_testthat() # adds testthat to DESCRIPTION, test folders
usethis::use_test("strsplit1") # add an actual test (or opens it if it exists)
# then run all your tests with
devtools::test() # or Ctrl + Shift + T; shortcut for testthat::test_dir()

# Using stuff from other packages (dependencies)
usethis::use_package("stringr") # declare an intent
# we'll now make strsplit1 more stringr-like
# stopifnot() is prtty great for making packages

# we can rename our updated function like so:
usethis::rename_files("strsplit1", "str_split_one")
