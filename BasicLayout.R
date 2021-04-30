## Basic_layout ####


library(shiny)

wfarm <- base64enc::dataURI(file="www/UKwindfarm.png", mime="image/png")

habitats <- read.csv("www/habitats.csv")

?radioButton

# Define UI ----
ui <- fluidPage(
  titlePanel("title panel"),
  
  sidebarLayout(
    sidebarPanel("MySidebar",
                 actionButton(inputId="my_submitstatus",
                              label="Submit"),
                 radioButtons(inputId = "Habitat", 
                                    h3("Choose a habitat type"), 
                                    choices = list("Woodland" = 1, 
                                                   "Grassland" = 2, 
                                                   "Urban" = 3),
                                    selected = 1)
                 ), #End of sidebarPanel
    
    mainPanel(
        h1("This is the main heading for my app"),
        h2("here is a subheading"),
        p("This website will be to help planners assess potential windfarm
           development areas in Cumbria, and achieve a ",strong("balance"),
           "between different ", em("interest groups"), "and other users."
           ),
        img(src=wfarm),
        plotOutput("habitats_plot")
    ),#End of mainPanel
    
    position = c("right")
  ) # End of Sidebarlayout 
)

?radioButtons

# Define server logic ----
server <- function(input, output) {
  output$habitats_plot <- renderPlot(
    hist(habitats[,as.numeric(input$Habitat)])
  )
}

# Run the app ----
shinyApp(ui = ui, server = server)


