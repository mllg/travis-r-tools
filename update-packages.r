options(repos = "http://cloud.r-project.org")
tryCatch({
  cat("Searching for outdated packages ...\n", file = stdout())
  getPkgs = function(x) if (is.null(x)) character(0L) else unname(x[, "Package"])
  sys.lib = .libPaths()[2L]
  req = getPkgs(old.packages())

  if (length(req)) {
    cat(sprintf("Updating %i packages: %s\n", length(req), paste(req, collapse = ", ")), file = stdout())
    install.packages(req, lib = user.lib)
  } else {
    cat("All packages up-to-date.\n", file = stdout())
  }
}, error = function(e) { cat(e$message, "\n", file = stderr()); flush(stderr()); q(status = 1L, save = "no") })
q(status = 0L, save = "no")
