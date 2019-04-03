shinyUI(pageWithSidebar(  
  headerPanel("Analysis of cars fuel consumption in mtcars data set"),  
  sidebarPanel(    
    radioButtons("secondVar", "Additional predictor",
                 c("Number of cylinders" = "cyl",
                   "Displacement (cu.in.)" = "disp",
                   "Gross horsepower" = "hp",
                   "Rear axle ratio" = "drat",
                   "Weight (1000 lbs)" = "wt",
                   "1/4 mile time" = "qsec",
                   "Engine (0 = V-shaped, 1 = straight)" = "vs",
                   "Number of forward gears" = "gear",
                   "Number of carburetors" = "carb"
                  )),
    h5("The mtcars data set is extracted from the 1974 Motor Trend US magazine, and comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles (1973–74 models).
The data set includes data for 32 cars with 11 variables:"),
tableOutput("varrs")),
  mainPanel(    
    plotOutput('myPlot'),
    p('p-value, associated with selected additional predictor:'),
    textOutput('myText'),
    h5("Studiing the mtcars dataset using the linear fit model we
illustrate, which variables of the data set should be included into the model
       in order to explain fuel consumption differrence between cars with automatic and manual transmittion.
       Selecting attitional predictor from the list using radiobuttons,
build additional linear fit1 with two predictors, compare it to basis fit0
with single predictor (type of transmission), and plot obtained linear fit versus
additional predictor. The p-value, associated with selected additional predictor
is also reported, giving an information of significance of the selected predictor 
to explanation of fuel consumption difference of cars from the data set.
       ")
  )
))

