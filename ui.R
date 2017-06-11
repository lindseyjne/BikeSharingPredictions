#data pulled from https://archive.ics.uci.edu/ml/datasets/bike+sharing+dataset

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Number of Shared Bikes Used from Temperature"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderTemp", "What is the temperature in Celcius?", 0, 1, value = 0.4),
      checkboxInput("showModel1", "Show/Hide Model", value = TRUE),
      submitButton("Submit")
    ),
  
  mainPanel(
    plotOutput("plot1"),
    h3("Predicting number of shared bikes"),
    textOutput("pred1")
  )
)
))
