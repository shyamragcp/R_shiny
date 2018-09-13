# HTML Tags are supported in Shiny eg: h1,h2 for Size of the Characters..
# To Add Radio button
# Variables are case sensitive.

library(shiny)
ui <- fluidPage(
  titlePanel(h1("Title"),windowTitle = "window title"),
  sidebarLayout(
    sidebarPanel("Side bar Panel",
                 textInput("name","Enter your name",""),
                 radioButtons("Gender","Please Select Button",list("Male","Female")),
                 sliderInput("slide","Please select a value from scale",min = 1,max = 10,value = 5),
                 selectInput("drop","Select names",c("Shyam","Anu","Kunju"),selected = NULL)),
    mainPanel("Main Panel",
              textOutput("Myname"),
              textOutput("Mygender"),
              textOutput("Myslide"),
              textOutput("Mydrop"))
  )
)
