#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Kmeans clustering of Motor Trend Car Road Tests (mtcars)"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("xvar",
                   "X variable",
                   choices = c("Miles/gallon"= "mpg",
                               "Number of cylinders"= "cyl",
                               "Displacement"="disp",
                               "Gross horsepower"="hp",
                               "Weight"= "wt",
                               "1/4 mile time"="qsec"),
                   selected="wt"),
       selectInput("yvar",
                   "Y variable",
                   choices = c("Miles/gallon"= "mpg",
                               "Number of cylinders"= "cyl",
                               "Displacement"="disp",
                               "Gross horsepower"="hp",
                               "Weight"= "wt",
                               "1/4 mile time"="qsec"),
                   selected="mpg"),
       sliderInput("N","Number of clusters",min=1,max=10,value=3,step=1),
       helpText("This application load mtcars dataset and allows to do kmeans clustering. User is allowed to select two variables to generate 
                plot and clustering result. X and Y inputs select variables. Plot is rendered every time when user changes any app input")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
