library(shiny)
library(randomForest)

predictMpg <- function(cyl, wt, hp, am)
{
  cars <- mtcars[, c("cyl", "wt", "hp", "am", "mpg")]
  fit <- randomForest(mpg ~ ., data = cars)
  result <- predict(fit, newdata = data.frame(cyl = c(cyl), wt = c(wt), hp = c(hp), am = (am)))
  return (result)
}

shinyServer(function(input, output) {
   
  output$cylValue <- renderPrint({input$cylTextbox})
  output$wtValue <- renderPrint({input$wtTextbox})
  output$hpValue <- renderPrint({input$hpTextbox})
  output$amValue <- renderPrint({input$amTextBox})
  output$mpgValue <- renderPrint({predictMpg(input$cylTextbox, input$wtTextbox, input$hpTextbox, input$amTextBox)})
  
})
