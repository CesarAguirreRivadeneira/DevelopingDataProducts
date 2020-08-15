#
#
#Aplicacion para el proyecto copia del ejemplo 2

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predict price of diamonds depending on carats,cut,color"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderCarat", "What is the carat of the diamond?", 0.2, 5.02, value = 1),
            selectInput("cut", "Select the cut:",c("Fair","Good","Very Good","Premium","Ideal"),multiple = FALSE),
            selectInput("color", "Select the color:",c("D","E","F","G","H","I","J"),multiple = FALSE),
            checkboxInput("showModel", "Show/Hide linear model", value = TRUE),
            submitButton("Submit")
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Diamond price from Model"),
            textOutput("pred1"),
        )
    )
))
