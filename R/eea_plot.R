#' Funkcja wyswietla wykres na podstawie wyniku funkcji "eea_szaco_emisji"
#'
#' Przyjmuje nastepujace argumenty:
#'
#' @param wynik - data frame, jest to wynik funkcji "eea_szaco_emisji"
#' @return plot
#'
#'
#' @export
eea_szaco_emisji <- function(dane = input,
                             kategoria = "Passenger Cars",
                             euro = "Euro 5",
                             mode = "",
                             substancja = c("EC", "CO")) {


  input <- data.frame(Nat = rnorm(50, mean = 100, sd = 50),
                      Segment = sample(c("Mini", "Small", "Medium", "Large-SUV-Executive"),
                                       size = 50, replace = T),
                      paliwo = "Petrol",
                      technologia = "GDI")

  input$Segment <- as.character(input$Segment)

  out <- wskazniki %>%
    filter(Category %in% kategoria) %>%
    filter(Euro.Standard %in% euro) %>%
    filter(Pollutant %in% substancja) %>%
    filter(Mode %in% mode)

  out <- inner_join(x = out, y = input, by = "Segment")

  out <- out %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
    ) %>%
    select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)
}


eea_plot <- function(wynik=out)
{

 ggplot(data = wynik, aes(x =Nat , y = Emisja)) +
  geom_point(alpha = 0.7, aes(color = Segment)) +
  labs(title = "Wykres rozrzutu Nateżenie do Emisji wg. segmentu auta") +
  labs(color = "Segment") -> out
return(out)
}

