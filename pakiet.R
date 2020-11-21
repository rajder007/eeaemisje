library(devtools)
library(tidyverse)

use_git()

use_r("fun_pack")


load_all()

save(wskazniki, file= "data/wskazniki.rda")


exists("fun_pack", where = globalenv(), inherits = FALSE)

rm(fun_pack)

exists("fun_pack", where = globalenv(), inherits = FALSE)


load_all()

#wczytanie funkcji w innym projekcie
source(file = "R/fun_pack.R")

rm(fun_pack)

load_all()
check()

library(roxygen2)

document()
check()

use_mit_license("Krzysztof Zaczyk")

document()
load_all()

fun_pack()

install()

check()

install.packages("digest")

use_package("dplyr")

load_all()

document()

install()

check()
