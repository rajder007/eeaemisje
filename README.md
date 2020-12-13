
<!-- README.md is generated from README.Rmd. Please edit that file -->

# eeaemisje

<!-- badges: start -->

<!-- badges: end -->

Celem pakietu `eeaemisje` jest obliczanie emisji na podstawie danych z
EEA. Aby ulatwic prace z pakietem stworzona zostala winieta i system
pomocy, ponizej szczególy.

# Instalacja (szybka)

``` r
# Potrzebujesz devtools ?
if (!require(devtools)) {install.packages("devtools"); require(devtools)}

# Instalujesz i wczytujesz
install_git("https://github.com/rajder007/eeaemisje")
library(eeaemisje)
```

Teraz mozesz korzystac z systemu pomocy.

``` r
?"eeaemisje"
?"eea_szaco_emisji"
?"eea_plot"
```

# Instalacja wraz z winietą (wolna)

``` r
# Potrzebujesz devtools ?
if (!require(devtools)) {install.packages("devtools"); require(devtools)}

# Instalujesz i wczytujesz
install_git("https://github.com/rajder007/eeaemisje", force = T, build_vignettes = T)
library(eeaemisje)
```

Teraz mozesz korzystac z rozbudowanego systemu pomocy.

``` r
# Podgląd winiety w przeglądarce
browseVignettes("eeaemisje")

# przejrzyj w oknie pomocy
vignette("eeaemisje")

# wyswietli tylko kod
edit(vignette("eeaemisje"))
```
