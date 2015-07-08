# travis-r-tools

Additional tools to use travis for R projects.

* `update-packages.r` can be called in your `.travis.yml` to ensure that all previously installed binary packages will get updated to the latest CRAN version (the binary packages can be a few days behind CRAN). Enable with the following lines in your `before_script` section:
```{bash}
- curl -L https://raw.githubusercontent.com/rdatsci/travis-r-tools/master/update-packages.r -o /tmp/update-packages.r
- Rscript /tmp/update-packages.r
```
* `c2d4u-packages` is an ascii file listing additional packages to be included into the [c2d4u](https://launchpad.net/~marutter/+archive/ubuntu/c2d4u) PPA of Michael Rutter.
  Pull requests welcome.
