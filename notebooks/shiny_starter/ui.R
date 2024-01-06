# Use a fluid Bootstrap layout
fluidPage(    
    
    # Give the page a title
    titlePanel("Global GDP and Life Expectancy Data"),
    
    # Generate a row with a sidebar
    fluidRow(      
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
    ),
    
    # Generate a row with a sidebar
    fluidRow(      
        # Generate a row with a sidebar
        sidebarLayout(      
            
            # Define the sidebar with one input
            sidebarPanel(
                selectInput("continent", 
                            "Continent:", 
                            choices=continent_choices)
            ),
            
            # Create a spot for the barplot
            mainPanel(
                plotOutput("gdpcontPlot")   
            )
        )
    )
)
    