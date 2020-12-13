library(devtools)
library(tidyverse)
library(xfun)
library(roxygen2)
library(ggplot2)


use_git()

use_r("newpack")


exists("fun_pack", where = globalenv(), inherits = FALSE)

rm(fun_pack)

exists("fun_pack", where = globalenv(), inherits = FALSE)


#wczytanie funkcji w innym projekcie
source(file = "R/fun_pack.R")




use_mit_license("Krzysztof Zaczyk")


wskazniki

rm(list = c("eea_szaco_emisji"))
rm(list = c("eea_plot"))

document()
check()
install()
load_all()



library(openxlsx)


# 1. Wczytanie wskazników  ------------------------------------------------

nazwa <- "C:/Users/Admin/Desktop/inwentaryzacjaemisji/zajecia1/dane.xlsx"

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

use_r("eea_plot")



library(ggplot2)

ggplot(data = wynik, aes(x =Nat , y = Emisja)) +
  geom_point(alpha = 0.7, aes(color = Segment)) +
  labs(  title = "Wykres rozrzutu Nateżenie do Emisji wg. segmentu auta") +
  labs(color = "Segment") -> out

usethis::use_vignette("my-vignette")
use_readme_rmd()

input <- data.frame(Nat = rnorm(50, mean = 100, sd = 50),
                    Segment = sample(c("Mini", "Small", "Medium", "Large-SUV-Executive"),
                                     size = 50, replace = T),
                    paliwo = "Petrol",
                    technologia = "GDI")


eeaemisje
input = c("EC", "CO")
str(input)
unique(wskazniki$Pollutant)

wynik <- eea_szaco_emisji(input = input,
                          kategoria = "Passenger Cars",
                          euro = "Euro 5",
                          mode = "",
                          substancja = c("EC", "CO","NOx", "VOC"))

wynik <- eea_szaco_emisji()

plocik <- eea_plot(wynik, legenda = "top", paleta = "Set1")
str(plocik)
load_all()


R.version
