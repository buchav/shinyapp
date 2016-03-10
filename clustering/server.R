#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
df<-mtcars
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    c1<-input$xvar
    c2<-input$yvar
    
    set.seed(123)
    df_combined<-df[,c(c1,c2)]  
    clust<-kmeans(df_combined,input$N)
    centers=as.data.frame(clust$centers)
    names(centers)<-c("V1","V2")
                
    p <- ggplot(df, aes_string(c1, c2))
    p<-p + geom_point(size=4,colour=clust$clust)+
            geom_point(data=centers, aes(x=V1,y=V2),shape=3,size=10,colour=rownames(centers))
    print(p)
  },height=600)
  
})
