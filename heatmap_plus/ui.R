library(shiny)
library(plotly)

shinyUI(fluidPage(
  titlePanel("Settings:"),
  sidebarPanel(
    sliderInput("bins", "Number of bins:", min = 1, max = 50, value = 10),
    selectInput("variable", "Variable for Boxplot:",
                list("Cylinders" = "cyl", 
                     "Transmission" = "am", 
                     "Gears" = "gear")),
    
    selectInput("colour", "Colour for Scatter:",
                       c("Blue" = "blue",
                         "Pink" = "pink")),
    
    selectInput("colorscale", "Colorscale for Heatmap:",
                c("Greens" = "Greens",
                  "Hot" = "Hot",
                  "Blues" = "Blues")),
    plotOutput("boxie")
        
  ),
  mainPanel(
    plotlyOutput("trendPlot"),
    plotlyOutput("heatmap"),
    plotOutput("scatter"))
))