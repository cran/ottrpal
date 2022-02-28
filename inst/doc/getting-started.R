## -----------------------------------------------------------------------------
ottrpal::bookdown_to_embed_leanpub(base_url = "https://jhudatascience.org/OTTR_Template/",
                                   make_book_txt = TRUE)

## -----------------------------------------------------------------------------
ottrpal::bookdown_to_embed_leanpub(base_url = "https://jhudatascience.org/OTTR_Template/",
                                   make_book_txt = TRUE,
                                   quiz_dir = "some_directory")

## -----------------------------------------------------------------------------
# Set up a character string
survey_link <- "Please provide any feedback you have in [this survey](www.some_link.org)"

# Supply the footer text in the main function
ottrpal::bookdown_to_embed_leanpub(base_url = "https://jhudatascience.org/OTTR_Template/",
                                   make_book_txt = TRUE,
                                   footer_text = survey_link)

## -----------------------------------------------------------------------------
sessionInfo()

