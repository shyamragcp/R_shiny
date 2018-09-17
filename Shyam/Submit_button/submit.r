library(shiny)

ui <- fluidPage(
  titlePanel("Submit button"),
  sidebarLayout(
    sidebarPanel(
      textInput("var1","Enter your name"),
      textInput("var2","Enter your surname"),
      submitButton("Apply Changes")
      ),
    mainPanel(
      textOutput("name"),
      textOutput("surname")
    )
  )
)
server <- function(input, output, session) {
  output$name <- renderText({
    input$var1
  })
  output$surname <- renderText({
    input$var2
  })
  
}

shinyApp(ui, server)