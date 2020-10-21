library(devtools)
library(tidyverse)

use_git()

use_r("fun_pack")


load_all()



fun_pack()

fun_pack(a = 1, b = 500, d = 23)





exists("fun_pack", where = globalenv(), inherits = FALSE)

rm(fun_pack)

exists("fun_pack", where = globalenv(), inherits = FALSE)



load_all()



source(file = "R/fun_pack.R")

rm(fun_pack)



load_all()



check()



library(roxygen2)



document()



check()



use_mit_license("Mateusz Rzeszutek")



document()



load_all()



fun_pack()



install()



check()



install.packages("digest")



use_package("base")

use_package("stats")

use_package("dplyr")



load_all()

document()

install()

check()
