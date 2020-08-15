#
#
#Aplicacion para el proyecto copia del ejemplo 2

library(shiny)
library(ggplot2)
shinyServer(function(input, output) {
 
    Fit <- lm(price ~ carat+cut+color, data = diamonds)
    
    predFit <- reactive({
        carat <- input$sliderCarat
        cut <- input$cut
        color <- input$color
        predict(Fit, newdata = data.frame(carat = carat,cut=cut,color=color))
    })
    
    output$plot1 <- renderPlot({
        carat <- input$sliderCarat
        cut <- input$cut
        color <- input$color
        plot(diamonds$carat, diamonds$price, xlab = "Diamonds Price", ylab = "Carat", bty = "n",col=as.factor(diamonds$color),ylim = c(50, 20000))
        if(input$showModel){
            abline(Fit, col = "red", lwd = 3)
        }
        points(carat, predFit(), col = "red", pch = 16, cex = 3)
    })
    
    output$pred1 <- renderText({
        predFit()
    })
    
})