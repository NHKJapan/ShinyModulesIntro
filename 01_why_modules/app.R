
library(shiny)

library(shiny)

#Create a slider function
slider <- function(){
    sliderInput("slider", "Slide Me", 0, 100, 1)
}


ui <- fluidPage(
    slider(),
    textOutput("number1"),
    
    #What if we add a second slider?
    #slider(),
    #textOutput("number2")
)

server <- function(input,output){
    
    output$number1 <- renderText({input$slider})
    
    #What if we add a second slider?
    #output$number2 <- renderText({input$slider})
}

# Run the application 
shinyApp(ui = ui, server = server)
