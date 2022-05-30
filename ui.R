
library(shiny)

# Define UI for application
shinyUI(fluidPage(

    titlePanel("Download the scatterplot"),

    sidebarLayout(
        sidebarPanel(selectInput("var1","Select the X variable",choices=c("Sepal.Length"=1,"Sepal.Width"=2,"Petal.Length"=3,"Petal.Width"=4)),
                     br(),
                     selectInput("var2","Select the Y variable",choices=c("Sepal.Length"=1,"Sepal.Width"=2,"Petal.Length"=3,"Petal.Width"=4)),
                     br(),
                     radioButtons("type","Select the file type",choices = list("jpeg","pdf"),selected = 'pdf')),

        mainPanel(plotOutput("plot") ,
                  downloadButton(outputId = "down",label = "Download the plot"))
    )
))
