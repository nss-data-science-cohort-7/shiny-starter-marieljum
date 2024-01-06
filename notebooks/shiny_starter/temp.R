### global 
library(shiny)
library(tidyverse)
library(echarts4r)
library(magrittr)
library(dplyr)

gdp = read_csv("data/gdp_per_capita.csv")

gdp_le = read_csv("data/gdp_le.csv")

country_choices <- gdp |> 
  pull(`Country or Area`) |> 
  unique() |> 
  sort()



### ui 
# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("GDP Per Capita"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("country", 
                  "Country:", 
                  choices=country_choices),
      helpText("Gross Domestic Product (GDP) per capita dataset from UN.")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("gdpPlot")  
    )
    
  )
)

## server 
# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$gdpPlot <- renderPlot({
    
    gdp |> 
      filter(`Country or Area` == input$country) |> 
      ggplot(aes(y = Value, x = Year)) + 
      geom_col() + 
      labs(y = 'GDP',
           x = 'Year')
    
  })
}


## ui part 2
dashboardPage(
  dashboardHeader(title = 'Global GDP and Life Expectancy Data',
                  titleWidth = 375),
  dashboardSidebar(),
  dashboardBody(
    fluidPage(
      # Generate a row with a sidebar
      sidebarLayout(      
        
        # Define the sidebar with one input
        sidebarPanel(
          selectInput("country", 
                      "Country:", 
                      choices=country_choices),
          helpText("Gross Domestic Product (GDP) per capita dataset from UN."), 
          box(
            title = "Information", status = "primary",
            verbatimTextOutput("infoText")
          )
        ),
        
        # Create a spot for the barplot
        mainPanel(
          plotOutput("gdpPlot")  
        )
      )
      
    )
  )
)

