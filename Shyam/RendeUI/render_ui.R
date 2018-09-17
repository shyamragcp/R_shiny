library(shiny)

# User interface.

ui <- fluidPage(
  titlePanel("Introduction to Render UI"),
  sidebarLayout(
    sidebarPanel(
      selectInput("var1","select Data set from drop down menu",choices = c("iris","trees","mtcars")),
      uiOutput("vx"),
      uiOutput("vy")
    ),
    mainPanel(
      plotOutput("myplot")
    )
  )
)


# Server side.


server <- function(input, output, session) {
  
  datasetnames <- reactive({
    switch (input$var1,
      "iris" = names(iris),
      "trees" = names(trees),
      "mtcars" = names(mtcars)
    )
  })
  
  output$vx <- renderUI({
    selectInput("var2","Select the column name for X axis",choices = datasetnames())
  })

  output$vy <- renderUI({
    selectInput("var3","Select the column name for Y axis",choices = datasetnames())
  })
  
  output$myplot <- renderPlot({
    attach(get(input$var1))
    plot(x=get(input$var2),y=get(input$var3),xlab = input$var2,ylab = input$var3)
  })
}

shinyApp(ui, server)