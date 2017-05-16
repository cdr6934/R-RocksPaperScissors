
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Self Learning Rock Paper Scissors Demonstration"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      strong("Please select Rock, Paper, Scissors"),
      actionButton("rockBtn","Rock"),
      actionButton("paperBtn","Paper"),
      actionButton("scissorsBtn","Scissors")
    ),

    # Show a plot of the generated distribution
    mainPanel(
      fluidRow(
        textOutput("statusTextOutput"),
        plotOutput("weightPlot")
      ),
      fluidRow(
        plotOutput("scorePlot"),
        textOutput("statusTextOutput2")
      )
    )
  )
))
