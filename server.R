
library(shiny)
library(tidyverse)

shinyServer(function(input, output) {
    x=reactive({
       as.numeric(input$var1)
    })
    y=reactive({
       as.numeric(input$var2)
    })
   output$plot= renderPlot({
        ggplot(data=iris,aes(iris[,x()],iris[,y()]))+geom_point(colour="royalblue")+xlab(names(iris[x()]))+ylab(names(iris[y()]))+theme_bw() 
    })
output$down=downloadHandler(
    #specify the filename
    filename = function(){
      paste("iris",input$type,sep = ".")  
    },
    content = function(file){
        #open the device
        #create the plot
        #close the device
        if(input$type=="jpeg")
            jpeg(file)
        else
            pdf(file)
        ggplot(data=iris,aes(iris[,x()],iris[,y()]))+geom_point(colour="royalblue")+xlab(names(iris[x()]))+ylab(names(iris[y()]))+theme_bw() 
        dev.off()
    }
)
})
