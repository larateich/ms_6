#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Olympic Curling Data on Winning the First End and the Game"),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("curlPlot")
        )
    )

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$curlPlot <- renderPlot({
        ggplot(proportion_olympics_quick, aes(year, prop_double_win, fill = team_group, label = round(prop_double_win, digits = 3))) + 
            geom_bar(stat = "identity", position = "dodge")+ 
            theme_classic()+ 
            labs(
                title = "Proportion of Curling Games 'decided' in the First End", 
                subtitle = "teams who made it to the final round are less affected 2018\nbut more affected in all other years", 
                x = "type of game", 
                y = "Proportion of total games won \nthat were won in the first end", 
                fill = "Team in finals?"
            )+ geom_text(position = position_dodge(width=1))
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
