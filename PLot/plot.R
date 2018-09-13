library(shiny)


# Userinterface

ui <- fluidPage(
  titlePanel(h2("Plotting -- Histograms.")),
  sidebarLayout(
    sidebarPanel(h3("Please apply Conditions"),
                 selectInput("var","Select variable to plot",choices = c("Sepal.Length"=1,"Sepal.Width"=2,"Petal.Length"=3,"Petal.Width"=4)),
                 sliderInput("slide","Select the number of bins in the instagram",min = 5,max = 25,value = 15),
                 radioButtons("color","Select the histogram color",choices = c("Green","Red","Blue"))
                 ),
    mainPanel(
      plotOutput("Myplot")
    )
  )
)


# Server side


server <- function(input, output, session) {
  output$Myplot <- renderPlot({
    colm <- as.numeric(input$var)
    hist(iris[,colm],breaks = seq(0,max(iris[,colm]),l=input$slide+1),col = input$color,main = "Histogram",xlab = names(iris[colm]))
  })
}

shinyApp(ui, server)