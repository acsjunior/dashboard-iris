library(shinydashboard)
library(ggplot2)
library(plotly)
source("data.R")

ui <- dashboardPage(
  
  dashboardHeader(title = "Dashboard Iris"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Histogramas", tabName = "histogramas", icon = icon("chart-bar")),
      menuItem("Dispersão", tabName = "dispersao", icon = icon("chart-bar"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "histogramas",
              fluidRow(
                box(width = 2,
                    selectInput(inputId = "select_specie", label = "Selecione a espécie", 
                                choices = unique(df$Species), 
                                selected = 1)),
                valueBoxOutput(width = 2, outputId = "value_observations"),
                valueBoxOutput(width = 2, outputId = "value_sepal_len_mean"),
                valueBoxOutput(width = 2, outputId = "value_sepal_wid_mean"),
                valueBoxOutput(width = 2, outputId = "value_petal_len_mean"),
                valueBoxOutput(width = 2, outputId = "value_petal_wid_mean")
              ),
              fluidRow(
                box(
                  plotlyOutput(outputId = "hist_sepal_len")),
                box(
                  plotlyOutput(outputId = "hist_sepal_wid")),
                box(
                  plotlyOutput(outputId = "hist_petal_len")),
                box(
                  plotlyOutput(outputId = "hist_petal_wid"))
                
              )
      ),
      tabItem(
        tabName = "dispersao",
        fluidRow(
          box(
            plotlyOutput(outputId = "scatter_1")),
          box(
            plotlyOutput(outputId = "scatter_2"))
        )
      )
    )
  )
)
