

consent <- function(tl,
                    final_page = psychTestR::final_page("Thank you for for completing our study!"),
                    intro_debrief = system.file('extdata/intro_debrief.xlsx', package = 'consentr')
                    ) {

  intro_debrief <- readxl::read_excel(intro_debrief)

  intro.text <- intro_debrief[intro_debrief$label == "information_sheet", ]$text
  debrief.text <- intro_debrief[intro_debrief$label == "debrief", ]$text


  timeline <- psychTestR::join(psychTestR::one_button_page(body = htmltools::HTML(intro.text)),
                               psychTestR::NAFC_page(label = "consent_1", prompt = htmltools::HTML(intro_debrief[intro_debrief$label == "consent_1", ]$text), choices = c("Yes", "No"), on_complete = need_consent),
                               psychTestR::NAFC_page(label = "consent_2", prompt = htmltools::HTML(intro_debrief[intro_debrief$label == "consent_2", ]$text), choices = c("Yes", "No"), on_complete = need_consent),
                               psychTestR::NAFC_page(label = "consent_3", prompt = htmltools::HTML(intro_debrief[intro_debrief$label == "consent_3", ]$text), choices = c("Yes", "No"), on_complete = need_consent),
                               psychTestR::NAFC_page(label = "consent_4", prompt = htmltools::HTML(intro_debrief[intro_debrief$label == "consent_4", ]$text), choices = c("Yes", "No"), on_complete = need_consent),
                               psychTestR::NAFC_page(label = "consent_5", prompt = htmltools::HTML(intro_debrief[intro_debrief$label == "consent_5", ]$text), choices = c("Yes", "No"), on_complete = need_consent),

                               tl,

                               psychTestR::one_button_page(body = htmltools::HTML(debrief.text)),

                               final_page
  )
}



need_consent <- function(answer, ...) {
  # check user consent
  res <- suppressWarnings(answer)
  if (!is.na(res) && res == "Yes") TRUE
  else psychTestR::display_error("Sorry, you cannot complete the test unless you give consent to this.")
}


