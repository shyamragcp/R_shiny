library(shiny)

server <- function(input,output){
  
  dataset <- reactive({
    switch (input$var1,
      "iris" = iris,
      "mtcars" = mtcars,
      "trees" = trees
    )
  })
  output$table <- renderTable({
    dataset()
  })
  
  fileext <- reactive({
    switch (input$var2,
            "Excel (CSV)" = "csv",
            "Text (TSV)" = "txt",
            "Text (Text Separated)" = "txt",
            "Doc" = "doc"
            )
  })
  
  output$down <- downloadHandler(
    filename = function(){
      paste(input$var1,fileext(),sep = ".")
    },
    content = function(file){
      sep <- switch (input$var2,
                     "Excel (CSV)" = ",",
                     "Text (TSV)" = "\t",
                     "Text (Text Separated)" = " ",
                     "Doc" = " "
                    )
      write.table(dataset(),file,sep = sep,row.names = FALSE)
    }
  )
}