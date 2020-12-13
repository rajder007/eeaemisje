#' Wizualizacja wyniku funkcji "eea_szaco_emisji"
#'
#' Na podstawie wyniku funkcji "eea_szaco_emisji"
#' wyswietla wykres rozrzutu zmiennej natezenie i obliczonej emisji
#' z podzialem wedlug rodzaju zanieczyszczenia
#'
#'
#' Przyjmuje nastepujace argumenty:
#'
#' @param dane - data frame, jest to wynik funkcji "eea_szaco_emisji"
#' @param paleta - character, argument dzieki któremu mozna zmienic palete barw
#' dostepnosc palet mozna sprawdzic w helpie funkcji 'scale_color_brewer'
#' @param legenda - character, argument zmieniajacy pozycje legendy
#' dostepne wartosci to: "none", "left", "right", "bottom", "top"
#'
#' @return plot
#' @examples
#' #' ## Zeby uzyc tej funkcji i stworzyc wykres musimy miec wynik obliczony
#' #dzieki funkcji 'eea_szaco_emisji'
#'
#' wynik <- eea_szaco_emisji()
#'
#' wykres <- eea_plot(dane = wynik, paleta = "Set1", legenda = "right")
#'
#' @export
eea_plot <- function(dane = wynik, paleta= "Set1", legenda= "right")
{

 ggplot(data = dane, aes(x =Nat , y = Emisja)) +
  geom_point(alpha = 100, aes(color = Pollutant)) +
  labs(title = "Wykres rozrzutu Nateżenia
        do Emisji wg.
        rodzaju zanieczyszenia") +
  labs(color = "Pollutant") +
    scale_color_brewer(palette = paleta) +
  theme(legend.position = legenda) -> out

return(out)

}

