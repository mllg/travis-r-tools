# updates all packages in the system lib which are outdated
# (the binary packages on travis)
options(repos = "http://cran.rstudio.com")
tryCatch({
  cat("Searching for outdated packages ...\n", file = stdout())
  getPkgs = function(x) if (is.null(x)) character(0L) else unname(x[, "Package"])
  user.lib = .libPaths()[1L]
  sys.lib = .libPaths()[2L]
  old = getPkgs(old.packages(lib = sys.lib))
  new = getPkgs(installed.packages(lib = user.lib))
  req = old[match(old, new, nomatch = 0L) == 0L]

  if (length(req)) {
    cat(sprintf("Updating %i binary packages: %s\n", length(req), paste(req, collapse = ", ")), file = stdout())
    install.packages(req, lib = user.lib)
  } else {
    cat("All binary packages up-to-date.\n", file = stdout())
  }
}, error = function(e) { cat(e, "\n", file = stderr()); flush(stderr()); q(status = 1L, save = "no") })
q(status = 0L, save = "no")
