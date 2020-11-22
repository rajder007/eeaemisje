#' Funkcja liczaca emisje
#'
#' @param dane
#' @param kategoria
#' @param euro
#' @param mode
#' @param substancja
#'
#' @return data frame z obliczona emisja
#'
#'
#'
#' @export

fun_pack <- function(dane = input,
                     kategoria = "Passenger Cars",
                     euro = "Euro 5",
                     mode = "",
                     substancja = c("EC", "CO")) {

  # Zabezpieczenia argumentów funkcji i danych wejscioweych.

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

  return(out)
}
