#' Funkcja liczaca emisje. Na podstawie danych z EEA.
#' Funkcja daje mozliwosc liczenia emisji ze wzgledu na rozne parametry,
#' ktore mozna zmieniac dzieki argumentom, ktore funkcja przyjmuje.
#'
#' Funkcja przyjmuje nastepujace argumenty:
#'
#' @param input - data frame, sklada sie z 50 wierszy o kolumnach: (Nat, segment, paliwo, technologia)
#' - nat, to liczba losowo generowana
#' - segment, character w tej kolumnie losowane sa wartosci sposrod 4 dostepnych
#' parametrów: "Mini", "Small", "Medium", "Large-SUV-Executive"
#' - paliwo, okresla sie rodzaj paliwa
#' - technologia, okresla rodzaj technologii oczyszczania spalin
#' @param kategoria - character okresla kategorie pojazdu
#' @param euro - Europejski standard emisji spalin
#' @param mode - zawiera rodzaj drogi
#' @param substancja - character, przyjmuje substancje dla ktorych chcemy
#' szacowac emisje, mozna tez podac wektor character
#'
#' @return data frame z obliczona emisja
#' @examples
#' #' ## Pierwszym argumentem jest obiekt data frame o nazwie 'input',
#' #bez podania argumentu input- domyslnie zostaje tworzony
#' #czesciowo losowy obiekt data frame taki jak ponizej
#'
#' input <- data.frame(Nat = rnorm(50, mean = 100, sd = 50),
#'                    Segment = sample(c("Mini", "Small", "Medium", "Large-SUV-Executive"),
#'                    size = 50, replace = TRUE),
#'                    paliwo = "Petrol",
#'                    technologia = "GDI")
#'
#' # Przyklad uzycia
#' wynik <- eea_szaco_emisji(input = input,
#'                           kategoria = "Passenger Cars",
#'                           euro = "Euro 5",
#'                           mode = "",
#'                           substancja = c("EC", "CO", "NOx", "VOC"))
#' @export
eea_szaco_emisji <- function(input = data.frame(Nat = rnorm(50, mean = 100, sd = 50),
                                               Segment = sample(c("Mini", "Small", "Medium", "Large-SUV-Executive"),
                                                                size = 50, replace = T),
                                               paliwo = "Petrol",
                                               technologia = "GDI"),
                             kategoria = "Passenger Cars",
                             euro = "Euro 5",
                             mode = "",
                             substancja = c("EC", "CO", "NOx", "VOC")) {

  #Zabezpieczenia przed blednymi argumentami funkcji

  if(!is.data.frame(input)) stop ("Blad! Podany argument 'input' nie jest obiektem data frame")
  if(!any(kategoria %in% wskazniki$Category)) stop ("Blad! Podany argument 'kategoria' jest spoza zakresu")
  if(!any(euro %in% wskazniki$Euro.Standard)) stop ("Blad! Podany argument 'euro' jest spoza zakresu")
  if(!any(mode %in% wskazniki$Mode)) stop ("Blad! Podany argument 'mode' jest spoza zakresu")
  if(!any(substancja %in% wskazniki$Pollutant)) stop ("Blad! Podany argument 'substancja' jest spoza zakresu")

  out <- wskazniki %>%
    filter(Fuel %in% input$paliwo) %>%
    filter(Technology %in% input$technologia) %>%
    filter(Category %in% kategoria) %>%
    filter(Euro.Standard %in% euro) %>%
    filter(Pollutant %in% substancja) %>%
    filter(Mode %in% mode)

  out <- inner_join(x = out, y = input, by = "Segment")

  out <- out %>%
    mutate(Emisja = Nat * ((Alpha * Procent ^ 2 + Beta * Procent + Gamma + (Delta/Procent))/
                             (Epsilon * Procent ^ 2 + Zita * Procent + Hta) * (1-Reduction))
          ) %>%
    select(Category, Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Alpha, Beta,
           Gamma, Procent, Delta, Epsilon, Zita, Hta, Nat, Emisja)

  return(out)
}
