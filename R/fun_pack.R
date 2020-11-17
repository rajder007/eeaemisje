#' Funkcja liczaca emisje
#'
#' @param dane
#' @param kategoria
#' @param euro
#' @param mode
#' @param substancja
#'
#' @return data frame z obliczona emisja
#' @export
#'
#' @examples
#'fun_pack(dane, kategoria, euro, mode, substancja )

fun_pack <- function(dane = input,
                     kategoria = "Passenger Cars",
                     #paliwo = "Petrol",
                     #segment = "Mini",
                     euro = "Euro 5",
                     #technologia = "GDI",
                     mode = "",
                     substancja = c("EC", "CO")) {

  # Zabezpieczenia argumentów funkcji i danych wejscioweych.

    out <- wskazniki
    out <- dplyr::filter(Category == kategoria)
    out <- dplyr::filter(Fuel == paliwo)
    out <- dplyr::filter(Euro.Standard == euro)
    out <- dplyr::filter(Technology == technologia)
    out <- dplyr::filter(Pollutant == substancja)
    out <- dplyr::filter(Mode == mode)

  out <- dplyr::inner_join(x = out, y = input, by = "Segment")

  out <- dplyr::mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction)))
  out <- dplyr::select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  return(out)

}
