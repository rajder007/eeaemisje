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

    out <- wskazniki
    out <- dplyr::filter(Category == kategoria)
    out <- dplyr::filter(Euro.Standard == euro)
    out <- dplyr::filter(Pollutant == substancja)
    out <- dplyr::filter(Mode == mode)

  out <- dplyr::inner_join(x = out, y = input, by = "Segment")

  out <- dplyr::mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction)))
  out <- dplyr::select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  return(out)

}
