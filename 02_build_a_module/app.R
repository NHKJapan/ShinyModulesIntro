#### 
# Build your own module
####

# UI function
# Step 1: Return shiny UI 
# Step 2: Make a namespace function
# Step 3: Wrap input and output ids in ns()

# Server Function

#1. Name function similarly to UI function
#2. Add server logic function, including session argument
#3. add `id` as input to the module fucntion and any additional parameters needed 
#4. Call `moduleServer()`
#5. `moduleServer` is passed `id` and a *module function*
    
###
# Shiny Module Template
###




####
# App Code
###
ui <- fluidPage(
    h6("Do you love Spring?"),
    actionButton("button", label = 'Vote'),
    verbatimTextOutput("out")
    
)

server <- function(input, output, session) {
    count <- reactiveVal(0)
    observeEvent(input$button, {
        count(count() + 1)
    })
    output$out <- renderText({
        count()
    })
    count

}

shinyApp(ui, server)