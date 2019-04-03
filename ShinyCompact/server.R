library(ggplot2)
library(tidyr)
data(mtcars)

shinyServer(  
  function(input, output) { 
    
    mtcars$am<-as.factor(as.character(mtcars$am))
    levels(mtcars$am)[levels(mtcars$am)=="0"] <- "Automatic"
    levels(mtcars$am)[levels(mtcars$am)=="1"] <- "Manual"
    fit0<-lm(mpg~am, data=mtcars)
    tabble<-as.data.frame(cbind(c("1", "2", "3", "4", "5", "6",  "7", "8", "9", "10", "11"),
                  c("mpg", "cyl", "disp", "hp", "drat", "wt",  "qsec", "vs", "am", "gear", "carb"),
                  c("Miles/(US) gallon", "Number of cylinders", "Displacement (cu.in.)", "Gross horsepower", "Rear axle ratio", "Weight (1000 lbs)",  "1/4 mile time", "Engine 0/1=V/I", "Transmission type", "Number of forward gears", "Number of carburetors")))
    names(tabble)<-c("column", "variable","explanation")
    output$varrs <- renderTable({
    tabble})
   
    output$myPlot <- renderPlot({
      ff<-as.formula(paste("mpg~am+",input$secondVar, collapse=""))
      g<-ggplot(mtcars, aes(get(input$secondVar), mpg, shape=am, colour=am, fill=am))+geom_point()
      g+labs(x=input$secondVar)+geom_smooth(method="lm")
       })

    output$myText<-renderText({
      ff<-as.formula(paste("mpg~am+",input$secondVar, collapse=""))
      fit1<-lm(ff, data=mtcars)
      paste(as.character(anova(fit0,fit1)$Pr[2]))
    })
    }
)