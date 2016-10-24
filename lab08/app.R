library(shiny)

ui <- fluidPage(
  headerPanel('Simple Linear Regression on Sales'),
  sidebarPanel(
    selectInput('ycol', 'Y Variable', names(advertising),
                selected = names(advertising)[[1]])
  ),
  mainPanel(
    plotOutput('plot1')
  )
)

server <- function(input, output) {
  advertising <- read.csv('Advertising.csv')
  advertising <- advertising[,2:5]
  selectedData <- reactive({
    advertising[, c('Sales', input$ycol)]
  })
  

output$plot1 <- renderPlot({
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(), pch = 20, cex = 3)
  })
  
}

shinyApp(ui = ui, server = server)
