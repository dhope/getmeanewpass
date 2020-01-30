# getmeanewpass
Generates a new password using the EFI code lists.

To install from github, you need to have `remotes` or `devtools` installed. (` install.packages('remotes')` or ` install.packages('devtools')`)
Then run ` remotes::install_github("dhope/getmeanewpass")` or ` devtools::install_github("dhope/getmeanewpass")`.

To install from source:
```r
install.packages("getmeanewpass_0.1.0.tar.gz", type = "source", repos=NULL)
```



To make your new password type:
```{r}
library(getmeanewpass)
get_me_a_new_password(lengthPass = 5, type = "EFF", nInt = 2)
```


Can change length and number of integers as needed

Don't save your workspace. You should clear it after using `rm(list =ls())` or `Shift-Ctrl-F10` in Rstudio


Disclaimer: I don't think this would be suitable for important passwords because it uses a random number generator and not dice, 
but is more intended for those of use required to change our passwords every few months.

**Use a password manager for most passwords**. 
