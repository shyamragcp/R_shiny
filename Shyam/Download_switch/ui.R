library(shiny)

ui <- fluidPage(
  titlePanel(h2("Data Set")),
  sidebarLayout(
    sidebarPanel(
      helpText("Please select Data set from below drop down menu"),
      selectInput("var1","Select one",choices = c("iris","mtcars","trees")),
      radioButtons("var2","Select the format in which you want to download.",choices = c("Excel (CSV)",
                                                                                         "Text (TSV)",
                                                                                         "Text (Text Separated)",
                                                                                         "Doc")),
      br(),
      helpText("Click below Button to Download the file"),
      downloadButton("var3","Click to Download")
    ),
    mainPanel(
      tableOutput("table")
    )
  )
)
