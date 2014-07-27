shinyUI(pageWithSidebar(
  
  headerPanel(""),
  
  sidebarPanel(
    uiOutput("choose_mark")


  ),
  
  
  mainPanel(
    plotOutput("dibujo"),
    plotOutput("dibujo2"),
    h4("Observations"),
    tableOutput("view")
  )
))