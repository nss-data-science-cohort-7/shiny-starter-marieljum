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
    
    output$gdpcontPlot <- renderPlot({
        
        gdp_le |>
            group_by(Continent) |> 
            summarize(Country_count = n_distinct(Country)) |> 
            ggplot(aes(x = Continent, y = Country_count, fill = Continent)) + geom_col()
        
    })
    
    output$infoText <- renderText({
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at auctor ante. 
     In ultrices scelerisque pellentesque. Phasellus mattis mauris sed ex congue, eu varius 
     diam iaculis. Sed hendrerit feugiat orci, feugiat dignissim lorem mollis sit amet. 
     Phasellus ac molestie sapien. Proin vestibulum elit tellus."
    })
}