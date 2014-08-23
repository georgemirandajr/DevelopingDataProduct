library(shiny)

shinyUI(pageWithSidebar(
  
  headerPanel("Simple prediction model of gas consumption"),
  
  # Sidebar with a slider input for number of bins
  sidebarPanel(
    p("This program allows you predict how much miles can a car with the specified characteristics drive.
    You can enter the following features: Number of cylinders, car weight, horsepower and transmission type. 
    After you enter all the characteristics press the Predict button to get the results"),

    sliderInput("cylTextbox",
                "Number of cylinders:",
                min = 1,
                max = 8,
                value = 2),
    
    numericInput("wtTextbox",
                "Car weight", value = 1.2, min = 0.5, max = 6, step = 0.1),
    
    numericInput("hpTextbox",
                 "Horsepower", value = 123, min = 50, max = 350, step = 10),

    checkboxInput("amTextBox", "Automatic transmission?", value = TRUE),
    
    submitButton("Predict miles per gallon")
  ),
  
  # Show a plot of the generated distribution
  mainPanel(
    h4("You have entered:"),
    p("Number of cylinders:"),
    verbatimTextOutput("cylValue"),
    
    p("Car weight:"),
    verbatimTextOutput("wtValue"),

    p("Horsepower:"),
    verbatimTextOutput("hpValue"),
    
    p("Automatic transmission:"),
    verbatimTextOutput("amValue"),
    
    h4("Predicted mpg (Higher is better):"),
    verbatimTextOutput("mpgValue")
  )
))
