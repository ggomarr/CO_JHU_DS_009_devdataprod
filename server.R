library(shiny)
mydata<-read.csv("fitbit_export_20150621.csv")
mydata$Date<-as.Date(mydata$Date)
mydata$NoDiveSteps<-mydata$Steps
mydata$NoDiveSteps[mydata$Diving]<-NA
mymafunc<-function(val,win) {
  myout<-NULL
  for (i in 1:length(val)) {
    myout<-c(myout,mean(val[max(i-win+1,0):i],na.rm=TRUE))
  }
  myout
}

shinyServer(
  function(input,output){
    output$avgWin<-renderPrint({input$daysAvg})
    output$incDive<-renderPrint({!input$ignoreDiving})
    output$myGraph<-renderPlot({
      if (input$ignoreDiving) {
        myval<-mymafunc(mydata$NoDiveSteps,input$daysAvg)
      }
      else {
        myval<-mymafunc(mydata$Steps,input$daysAvg)
      }
      plot(mydata$Date,myval,type='l',ylim=c(0,25000),xlab="Date",ylab="Number of steps")
    })
  }
)