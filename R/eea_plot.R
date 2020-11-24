#' Funkcja wyswietla wykres na podstawie wyniku funkcji "eea_szaco_emisji"
#'
#' Przyjmuje nastpujepujace argumenty:
#'
#' @param wynik - data frame, jest to wynik funkcji "eea_szaco_emisji"

#' @return plot
#'
#'
#' @export

eea_plot <- function(wynik)

 ggplot(data = wynik, aes(x =Nat , y = Emisja)) +
  geom_point(alpha = 0.7, aes(color = Segment)) +
  labs(  title = "Wykres rozrzutu Nateżenie do Emisji wg. segmentu auta") +
  labs(color = "Segment") -> out
return(out)
