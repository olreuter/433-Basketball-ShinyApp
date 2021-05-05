
library(shiny)

wisco_scores <- data.frame("opponent" = c("Minnesota","Indiana","Michigan","Rutgers","Northwestern", "Ohio State", "Maryland","Penn State","Penn State 2", "Illinois", "Nebraska", "Michigan2", "Iowa", "Northwestern 2", "Illinois 2", "Purdue", "Iowa 2","Penn State 3", "Iowa 3", "UNC", "Baylor"), "wiscore" = c(71, 80, 54,60, 68,62,61,71,72,60,61,59,62,68,69,69,73,75,57,85,63), "oppscore" = c(59,73,77, 54,52,74,55,81,56,75,48,67,77,51,74,73,77,74,62,62,76), "wispredict" = c(74,71,55,73,72,70,70,74,74,71,74,69,72,71,70,68,71,71,71,70,68), "oppredict" = c(60,50,54,81,66,64,66,67,70,69,65,68,73,67,71,66,72,68,73,68,69))
wisco_scores
row.names(wisco_scores) <- wisco_scores$opponent
wisco_scores$opponent <- NULL

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    
    titlePanel("Wisconsin vs. Opponent Predicted and Actual Scores"),
        
        # Generate a row with a sidebar
        sidebarLayout(      
            
            # Define the sidebar with one input
            sidebarPanel(
                selectInput("opponent", "Opponent:", 
                            choices=rownames(wisco_scores)),
                hr(),
                helpText("Opponent Choice from the last half of the 2020-21 College Basketball Season")
            ),
            
            # Create a spot for the barplot
            mainPanel(
                plotOutput("scorePlot")  
            )
            
        )
    ))