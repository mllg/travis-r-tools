# updates all outdated packages
# in contrast to 'update.packages()' this will also update
# packages in the system lib by 'overloading' these packages
# with an installation to the user lib
tryCatch({
  user.lib = .libPaths()[1L]
  sys.lib = .libPaths()[2L]
  old = unname(old.packages(lib = sys.lib)[, "Package"])
  new = unname(installed.packages(lib = user.lib)[, "Package"])
  req = old[match(old, new, nomatch = 0L) == 0L]

  if (length(req)) {
    options(repos = "http://cran.rstudio.com")
    install.packages(req)
  }
}, error = function(e) { message(e); q(status = 1, save = "no") })
