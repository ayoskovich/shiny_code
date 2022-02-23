library(shiny)

shinyUI(fluidPage(

    titlePanel("The github action is working, I think..."),

    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30),
            includeMarkdown('subtitle.md')
        ),

        mainPanel(
            plotOutput("distPlot")
        )
    )
))
