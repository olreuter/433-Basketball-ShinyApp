library(shiny)
library(ggplot2)
wisco_scores <- data.frame("opponent" = c("Minnesota","Indiana","Michigan","Rutgers","Northwestern", "Ohio State", "Maryland","Penn State","Penn State 2", "Illinois", "Nebraska", "Michigan2", "Iowa", "Northwestern 2", "Illinois 2", "Purdue", "Iowa 2","Penn State 3", "Iowa 3", "UNC", "Baylor"), "Wisconsin Actual" = c(71, 80, 54,60, 68,62,61,71,72,60,61,59,62,68,69,69,73,75,57,85,63), "Opponent Actual" = c(59,73,77, 54,52,74,55,81,56,75,48,67,77,51,74,73,77,74,62,62,76), "Wisconsin Predicted" = c(74,71,55,73,72,70,70,74,74,71,74,69,72,71,70,68,71,71,71,70,68), "Opponent Predicted" = c(60,50,54,81,66,64,66,67,70,69,65,68,73,67,71,66,72,68,73,68,69))
wisco_scores
row.names(wisco_scores) <- wisco_scores$opponent
wisco_scores$opponent <- NULL

# Define a server for the Shiny app
shinyServer(function(input, output) {
    
    # Fill in the spot we created for a plot
    output$scorePlot <- renderPlot({
        dat_list <- wisco_scores[input$opponent,]
        vals1 <- c(wisco_scores[input$opponent,1], wisco_scores[input$opponent,2],wisco_scores[input$opponent,3],wisco_scores[input$opponent,4])
        datframe <- data.frame(name = colnames(dat_list), 
                               vals = vals1)
        # Render a barplot
        ggplot(datframe,
               aes(x = name, 
                   y = vals)) +
            geom_bar(stat = "identity",
                     position = "dodge",
                     fill = c("light blue", "light green", "maroon", "red"))+
            xlab("Individual Games") +
            ylab("Scores") +
            ggtitle("Wisconsin Badgers Basketball Predicted Games vs. Actual")
    })
})