library(shiny)
server <- function(input, output, session) {
  output$Myname <- renderText(input$name)
  output$Mygender <- renderText(input$Gender)
  output$Myslide <- renderText(paste("Selected value as: ",input$slide))
  output$Mydrop <- renderText(paste("Slected name is : ",input$drop))
}
