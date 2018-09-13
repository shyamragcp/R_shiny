ui <- fluidPage(
  titlePanel(h2("Plotting -- Histograms.")),
  sidebarLayout(
    sidebarPanel(h3("Please apply Conditions"),
                 selectInput("var","Select variable to plot",choices = c("Sepal.Length"=1,"Sepal.Width"=2,"Petal.Length"=3,"Petal.Width"=4)),
                 sliderInput("slide","Select the number of bins in the instagram",min = 5,max = 25,value = 15),
                 radioButtons("color","Select the histogram color",choices = c("Green","Red","Blue"))
    ),
    mainPanel(
      tabsetPanel(type="tab",
        tabPanel("Summary",verbatimTextOutput("Summary")),
        tabPanel("Structure",verbatimTextOutput("Str")),
        tabPanel("Data",tableOutput("data")),
        tabPanel("Plot",plotOutput("Myplot"))
      )
    )
  )
)