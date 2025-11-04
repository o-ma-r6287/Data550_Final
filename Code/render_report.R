here::i_am(
  "code/render_report.R"
)

rmarkdown::render(
  here::here("Lung_cancer_report.Rmd")
)
