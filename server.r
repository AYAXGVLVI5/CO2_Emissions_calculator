data_sets <- c("English", "Spanish")
data<-read.csv("vehicles.csv")

shinyServer(function(input, output) {
  
  # Drop-down selection box for which data set
  output$choose_mark <- renderUI({
    selectInput("mark", "Choose your vehicle mark", unique(data$marca))
   
  })
  output$choose_model <- renderUI({
    selectInput("trans", "Choose your vehicle's transmission", c("automatic","manual"))
    
  })
  output$choose_type <- renderUI({
    selectInput("type", "Choose your type of vehicle", c("automovil","van","truck","camper" ))
    
  })
  
  # Output the data
  output$dibujo <- renderPlot({
    # If missing input, return to avoid error later in function
    if(is.null(input$mark))
      return()
        
       a<-subset(data,marca==input$mark ,select= c(tipo,CO2emission))
       plot (a)
       
  })
  output$dibujo2 <- renderPlot({
    # If missing input, return to avoid error later in function
    if(is.null(input$mark))
      return()
    b<-subset(data,marca==input$mark ,select= c(transmision,CO2emission))
    plot (b)
  })
  # Show the first "n" observations
  output$view <- renderTable({
    
    a<-subset(data,marca==input$mark,select= c(tipo,transmision,CO2emission))    
    
    
  })
})