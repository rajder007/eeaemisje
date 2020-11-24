library(devtools)
library(tidyverse)
library(roxygen2)

use_git()

use_r("newpack")


load_all()

save(wskazniki, file= "data/wskazniki.rda")


exists("fun_pack", where = globalenv(), inherits = FALSE)

rm(fun_pack)

exists("fun_pack", where = globalenv(), inherits = FALSE)


load_all()

#wczytanie funkcji w innym projekcie
source(file = "R/fun_pack.R")

rm(list = c("eea_szaco_emisji"))

load_all()
check()

library(roxygen2)

document()
check()

use_mit_license("Krzysztof Zaczyk")

document()
load_all()

eea_szaco_emisji()


wskazniki
check()

install.packages("digest")

use_package("dplyr")

load_all()

document()

install()


check()
fun_pack()

library(openxlsx)
library(tidyverse)


# 1. Wczytanie wskazników  ------------------------------------------------

nazwa <- "C:/Users/Admin/Desktop/inwentaryzacja_emisji/zajecia1/dane.xlsx"

wskazniki <- openxlsx::read.xlsx(xlsxFile = nazwa)

wskazniki$Mode[is.na(wskazniki$Mode)] <- ""

wskazniki <- wskazniki %>%
  select(-`EF.[g/km].or.ECF.[MJ/km]`,
         -`Min.Speed.[km/h]`,
         -`Max.Speed.[km/h]`,
         -Road.Slope,
         -Load)

colnames(wskazniki)[15:17] <- c("Reduction", "Bio", "Procent")

save(wskazniki, file = "data/wskazniki.rda")

usethis::use_r("data.R")

install_git("https://github.com/rajder007/eeaemisje")

