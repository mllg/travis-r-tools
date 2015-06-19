# updates all outdated packages
# in contrast to 'update.packages()' this will also update
# packages in the system lib by 'overloading' these packages
# with an installation to the user lib
tryCatch({
  library(data.table)
  fields = c("Package", "LibPath", "Version")
  pkgs = data.table(installed.packages(fields = fields), key = "Package")
  pkgs = pkgs[, fields, with = FALSE][data.table(old.packages()[, c("Package", "ReposVer")])]
  pkgs = pkgs[!pkgs[LibPath == .libPaths()[1L] & package_version(Version) >= package_version(ReposVer)]]
  if (nrow(pkgs)) {
    options(repos = "http://cran.rstudio.com")
    install.packages(pkgs[, unique(Package)])
  }
}, error = function(e) { message(e); q(status = 1, save = "no") })
