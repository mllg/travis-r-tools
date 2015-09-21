# bootstrap packages for travis' container builds
options(repos = "http://cran.rstudio.com")

if (length(find.package("devtools", quiet = TRUE)) == 0L) {
    install.packages("devtools")
}

library(devtools)
update_packages("devtools")
install_deps(".")
