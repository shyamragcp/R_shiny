library(shiny)

ui <- fluidPage(
  titlePanel("Action and isolate button"),
  sidebarLayout(
    sidebarPanel(
      textInput("var1","Please enter your name below"),
      textInput("var2","Please enter your Surname"),
      actionButton("action","Click to ")
    ),
    mainPanel(
      textOutput("Myname"),
      textOutput("Surname")

    )
  )
)

server <- function(input, output, session) {
  output$Myname <- renderText({
    input$var1
  })
  output$Surname <- renderText({
    input$action
    isolate(input$var2)
  })
}

shinyApp(ui, server)

