# Download Button.

library(shiny)

ui <- fluidPage(
  titlePanel(h2("Iris Data Set")),
  sidebarLayout(
    sidebarPanel(
      selectInput("var1","Select the variable",choices = c("Sepal.Length" = 1,
                                                           "Sepal.Width" = 2,
                                                           "Petal.Length" = 3,
                                                           "Petal.Width" = 4),
                  selected = 1),
      selectInput("var2","Select the variable",choices = c("Sepal.Length" = 1,
                                                           "Sepal.Width" = 2,
                                                           "Petal.Length" = 3,
                                                           "Petal.Width" = 4),
                  selected = 2),
      radioButtons("format","Select Image Format",choices = c("png","pdf"))
    ),
    mainPanel(
      plotOutput("plot"),
      downloadButton("down","Download file")
    )
  )
  
)

server <- function(input, output, session) {
  
  x<- reactive({
    colm <- as.numeric(input$var1)
    iris[,colm]
  })
  
  y<- reactive({
    colm <- as.numeric(input$var2)
    iris[,colm]
  })
  
  output$plot <- renderPlot({
    plot(x(),y(),main = "Scatter plot",xlab = names(x()),ylab = names(y()))
  })
  
  output$down <- downloadHandler(
    filename = function(){
      paste("iris",input$format,sep = ".")
    },
    content = function(file){
      # Open the device
      # create the plot
      # Close the Device
      
      if (input$format == "png")
        png(file)
      else
        pdf(file)
      plot(x(),y())
      dev.off()
    }
  )
}  

shinyApp(ui, server)
