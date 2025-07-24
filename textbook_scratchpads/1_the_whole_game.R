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
