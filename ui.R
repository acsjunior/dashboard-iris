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
      tabItem(
        tabName = "histogramas",
        fluidRow(
          box(width = 2,
            selectInput("select_especie", label = "Selecione a espécie", 
                        choices = especies, 
                        selected = 1)),
          
          valueBoxOutput(width = 2, "value_observations"),
          valueBoxOutput(width = 2, "value_sepal_len_mean"),
          valueBoxOutput(width = 2, "value_sepal_wid_mean"),
          valueBoxOutput(width = 2, "value_petal_len_mean"),
          valueBoxOutput(width = 2, "value_petal_wid_mean")
        ),
        fluidRow(
          box(width = 6,
              plotlyOutput(outputId = "hist_sepal_len")),
          box(width = 6,
              plotlyOutput(outputId = "hist_sepal_wid")),
          box(width = 6,
              plotlyOutput(outputId = "hist_petal_len")),
          box(width = 6,
              plotlyOutput(outputId = "hist_petal_wid"))
        )
      ),
      tabItem(
        tabName = "dispersao",
        fluidRow(
          box(width = 6,
              plotlyOutput(outputId = "scatter_1")),
          box(width = 6,
              plotlyOutput(outputId = "scatter_2"))
        )
      )
    )
  )
)