# Load R packages
library(shiny)
library(shinythemes)

# Define UI
ui <- fluidPage(theme = shinytheme("cerulean"),
                navbarPage(
                  
                  "COVID-19 Mortality Risk for Unvaccinated Patient",
                  tabPanel("Calculator",
                           sidebarPanel(
                             tags$h2("Input Patient's Information:"),
                             numericInput("num1", "Age: (Years)", ""),
                             numericInput("num2", "Sex: (Enter 1, if Male; Enter 0, if Female)", ""),
                             tags$h4("Race & Ethnicity: Please enter 1 in only one category"),
                             numericInput("num3", "Non-Hispanic White: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num4", "Non-Hispanic Black: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num5", "Non-Hispanic Asian or Pacific Islander: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num6", "Non-Hispanic Other Race: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num7", "Ethnicity (Hispanic): (Enter 1, if Yes; Enter 0, if No)", ""),
                             tags$h4("Clinical Risk factors: Please choose any relevant category"),
                             numericInput("num8", "Dyspnea or Hypoxemia: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num9", "Overweight or Obesity: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num10", "Essential Hypertension: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num11", "Diabetes Mellitus: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num12", "Chronic Cardiovascular Disease: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num13", "Chronic Kidney Disease: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num14", "Chronic Pulmonary Disease: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num15", "Malignant Neoplasms: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num16", "Dementia: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num17", "HIV: (Enter 1, if Yes; Enter 0, if No)", ""),
                             numericInput("num18", "Cerebral Palsy: (Enter 1, if Yes; Enter 0, if No)", "")
                             
                           ), # sidebarPanel
                           mainPanel(
                             h2("Risk Score"),
                             
                             verbatimTextOutput("txtout"), 
                             h3("Method I: ") , 
                             h4("≥0.101: Stage II  (High risk for mortality)") , 
                             h4("<0.101: Stage I   (Low risk for mortality)"),
                             
                             h3("Method II: ") , 
                             h4(">=0.474: Stage V   (High risk for mortality)") , 
                             h4("[0.149-0.474): Stage IV   (at-risk-(high end) for mortality)"),
                             h4("[0.106-0.149): Stage III   (at-risk for mortality)") , 
                             h4("[0.042-0.106): Stage II   (at-risk-(low end) for mortality)"),
                             h4("0.042: Stage I   (Low risk for mortality)")  
                           ) # mainPanel
                  ) ) ) 

# Define server function  
server <- function(input, output) {
  
  output$txtout <- renderText({
    paste(exp(-7.1199+0.0527*input$num1+0.4341*input$num2+0.3759*input$num4+0.4133*input$num7+0.5112*input$num5+0.281*input$num6+1.1046*input$num8+0.4199*input$num9+0.1689*input$num10+0.3957*input$num11+0.177*input$num12+0.7263*input$num13+0.3076*input$num14+0.2193*input$num15+0.3662*input$num16+0.2918*input$num17+0.7647*input$num18) )
  })
}

# Create Shiny object
shinyApp(ui = ui, server = server)