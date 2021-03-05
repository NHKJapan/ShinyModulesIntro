library(shiny)

counterInput <- function(id, label = "Vote") {
    ns <- NS(id)
    tagList(
        actionButton(ns("button"), label = label),
        verbatimTextOutput(ns("out"))
    )
}

counterServer <- function(id) {
    moduleServer(
        id,
        function(input, output, session) {
            count <- reactiveVal(0)
            observeEvent(input$button, {
                count(count() + 1)
            })
            output$out <- renderText({
                count()
            })
            count
        }
    )
}

ui <- fluidPage(
    h6("Do you love Spring?"),
    counterInput("spring")
    
)

server <- function(input, output, session) {
    counterServer("spring")

}

shinyApp(ui, server)