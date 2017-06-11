#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

setwd("D:/Bike-Sharing-Dataset")
bikeData <- read.csv('day.csv')
head(bikeData)
set.seed(199)

library(shiny)

shinyServer(function(input, output){
  #model1 <- lm(Girth ~ Volume, data = bikeData)
  model1 <- lm(cnt ~ temp, data = bikeData)
  
  model1pred <- reactive({
    tempInput <- input$sliderTemp
    predict(model1, newdata = data.frame(temp = tempInput))
  })
  
  output$plot1 <- renderPlot({
    tempInput <- input$sliderTemp
    
    plot(bikeData$temp, bikeData$cnt, xlab = "Temperature in Celcius", ylab = "Number of Bikes Shared")
    if(input$showModel1){
      abline(model1, col = "hot pink", lwd = 2)
    }
    
    
    legend(0.05, 8000, "Model Prediction", col = "hot pink", pch = 16, bty = "n", cex = 1.5)
           points(tempInput, model1pred(), col = "green", pch = 16, cex = 1.5)
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
})
