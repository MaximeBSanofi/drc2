### To build local package using existing R source code, need to
### 1. Make sure R version is correct
### 2. Make sure correct Rtools is installed
### https://cran.r-project.org/bin/windows/Rtools/
### 3. install devtools
### Click on Build-->Build Source Package
install.packages("devtools")
library(devtools)
## install package locally
install.packages("G:/Current users/Jiyoung/drc2_0.1.0.tar.gz", repos = NULL)

library(drc2)  ### load and check
