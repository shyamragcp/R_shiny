server <- function(input, output, session) {
    colm <- reactive({
      as.numeric(input$var)
    })
    output$Summary <- renderPrint({
      summary(iris)
    })  
  
    output$Str <- renderPrint({
      str(iris)
    })
  
    output$data <- renderTable({
      head(iris)
    })
    output$Myplot <- renderPlot({
    # colm <- as.numeric(input$var)
    hist(iris[,colm()],breaks = seq(0,max(iris[,colm()]),l=input$slide+1),col = input$color,main = "Histogram",xlab = names(iris[colm()]))
  })
}
