

setwd('/Users/sebsilas/consentr/app')

shiny::addResourcePath(prefix = 'assets', directoryPath = '/Users/sebsilas/consentr/app/www')

psychTestR::new_timeline(psychTestR::one_button_page("Hi")) %>%
  consent() %>%
  psychTestR::make_test()


