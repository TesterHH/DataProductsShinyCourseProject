shinyUI(pageWithSidebar(  
  headerPanel(""),  
  sidebarPanel(    
    radioButtons("secondVar", "Add predictor:",
                 c("Num. cylinders" = "cyl",
                   "Displacement" = "disp",
                   "Horsepower" = "hp",
                   "Rear ax. ratio" = "drat",
                   "Weight" = "wt",
                   "1/4 m. time" = "qsec",
                   "Engine type" = "vs",
                   "Num. gears" = "gear",
                   "Num. carburetors" = "carb"
                 ))),
  mainPanel(    
    plotOutput('myPlot'),
    p('p-value, for additional predictor:'),
    textOutput('myText')
  )
))

