#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  includeCSS("styles.css"),
  

  
  # Application title
  h1("Next Word Predict-ROAR"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Enter a phrase to see the next likely word", style="font-family: 'Arial' ; color:#48ca3b;"),
        textInput(inputId="user_input", 
                  label="")
      #can also set #value=
         # numericInput(inputId="testnumber", 
          #             label="Type in any number", value=10),
         # submitButton("Submit") # need this to make the function not run until they submit?
            
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(  # panel 1
        tabPanel("App",
         textOutput("parrot", container=span),
         textOutput("changed"),
         #dataTableOutput('view')),
         tableOutput("view")),
         #textOutput("view")),
        
        
        # this suppresss warning messages
        tags$style(type="text/css", 
                   ".shiny-output-error { visibility: hidden; }",
                   ".shiny-output-error:before { visibility: hidden; }"
        ),
        
      tabPanel("Explanation",
            h4("Data Set and Project Description"),
               h5("This project is the Capstone Project for the John's Hopkins Data Science Specialization through Coursera.
                 The purpose of this project is to showcase the skills learned in the fist nine courses as well as
                 adding skills relating to Natural Language Processing and working with larger data sets."),
               h5("The dataset can be found at: https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"),
               
            h4("Model"),
              h5("The data used for the Next Word Predic-tor is comprised of 
                  all lines of news and twitter text that can be found in the 
                  link above. After uni-grams to five-grams were created, any occurence less than 4 were 
                  removed for speed purposes. The prediction model is based off the Stupid Back-off Model.
                  More information can be found here: http://www.aclweb.org/anthology/D07-1090.pdf"),
            
            h4("Code"),
            h5("All code used to pre-process and create this app can be found at the link below. As of 2.4.18 this code was
               NOT cleaned for readibility. This app will continue to be updated for speed, accuracy, and code 
              readibility in the next month. https://github.com/sneakekat/Word-Prediction-App")
                
               
              
               )  #panel 2 end
        
      # tableOutput("view")
       #textOutput("predictions3"),
       #DT::dataTableOutput("predictions2")
       #dataTableOutput("predictions2")
      )
    )
  )
))
