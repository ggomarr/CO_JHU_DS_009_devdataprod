library(shiny)
shinyUI(pageWithSidebar(
  headerPanel(
    "Rolling average number of steps"
  ),
  sidebarPanel(
    h3("Parameters"),
    numericInput('daysAvg','Rolling average window (days)', 1, min=1, max=15, step=1),
    checkboxInput('ignoreDiving','Ignore diving days',FALSE)
  ),
  mainPanel(
    p("On top of a data freak, I am a fitness freak."),
    p("The purpose of this app is to help me determine which number of days window length produces the most meaningful average when exploring the rolling average number of steps taken, as measured by the FitBit strapped to my wrist. The length of the window can be selected on the panel to the left."),
    p("On top of a fitness freak, I am a diving freak."),
    p("Good as it is, I cannot take my FitBit with me while diving. The diving days therefore bias the result. They can be ignored in the calculation of the rolling average by clicking the checkbox."),
    plotOutput('myGraph'),
    h4("Parameters"),
    p("Length of the window"),
    verbatimTextOutput('avgWin'),
    p("Include diving days"),
    verbatimTextOutput('incDive')
  )
))