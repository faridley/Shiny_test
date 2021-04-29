## Basic_layout ####


library(shiny)

wfarm <- base64enc::dataURI(file="www/UKwindfarm.png", mime="image/png")


# Define UI ----
ui <- fluidPage(
  titlePanel("title panel"),
  
  sidebarLayout(
    sidebarPanel("sidebar panel"),
    mainPanel(
      h1("This is the main heading for my app"),
      h2("here is a subheading"),
      p("This website will be to help planners assess potential windfarm
           development areas in Cumbria, and achieve a ",strong("balance"),
           "between different ", em("interest groups"), "and other users."
           )
      ),
    position = c("right")
  ) 
)

# Define server logic ----
server <- function(input, output) {
  
}

# Run the app ----
shinyApp(ui = ui, server = server)



?sidebarPanel
