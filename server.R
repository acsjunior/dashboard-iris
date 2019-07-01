library(shiny)
library(ggplot2)
source("data.R")


server <- function(input, output) {
  
  output$hist_sepal_len <- renderPlotly({
    data <- df[df$Species == input$select_specie, ]
    plot <- plot.histogram(data, "Sepal.Length", "Comprimento de Sépala", "Frequência")
    ggplotly(plot)
  })
  
  output$hist_sepal_wid <- renderPlotly({
    data <- df[df$Species == input$select_specie, ]
    plot <- plot.histogram(data, "Sepal.Width", "Largura de Sépala", "Frequência")
    ggplotly(plot)
  })
  
  output$hist_petal_len <- renderPlotly({
    data <- df[df$Species == input$select_specie, ]
    plot <- plot.histogram(data, "Petal.Length", "Comprimento de Pétala", "Frequência")
    ggplotly(plot)
  })
  
  output$hist_petal_wid <- renderPlotly({
    data <- df[df$Species == input$select_specie, ]
    plot <- plot.histogram(data, "Petal.Width", "Largura de Pétala", "Frequência")
    ggplotly(plot)
  })
  
  output$value_observations <- renderValueBox({
    valueBox(
      nrow(df[df$Species == input$select_specie, ]), "Unidades Observadas", icon = icon("list"),
      color = "blue"
    )
  })
  
  output$value_sepal_len_mean <- renderValueBox({
    valueBox(
      round(mean(df[df$Species == input$select_specie, "Sepal.Length"]),1), "Compr. Médio Sépala", icon = icon("calculator"),
      color = "teal"
    )
  })
  
  output$value_sepal_wid_mean <- renderValueBox({
    valueBox(
      round(mean(df[df$Species == input$select_specie, "Sepal.Width"]),1), "Largura Média Sépala", icon = icon("calculator"),
      color = "navy"
    )
  })
  
  output$value_petal_len_mean <- renderValueBox({
    valueBox(
      round(mean(df[df$Species == input$select_specie, "Petal.Length"]),1), "Compr. Médio Pétala", icon = icon("calculator"),
      color = "light-blue"
    )
  })
  
  output$value_petal_wid_mean <- renderValueBox({
    valueBox(
      round(mean(df[df$Species == input$select_specie, "Petal.Width"]),1), "Largura Média Pétala", icon = icon("calculator"),
      color = "purple"
    )
  })
  
  output$scatter_1 <- renderPlotly({
    plot <- plot.scatter(df, "Petal.Length", "Sepal.Length", "Species", "Comprimento de Pétala", "Comprimento de Sépala", "Espécie")
    ggplotly(plot)
  })
  
  output$scatter_2 <- renderPlotly({
    plot <- plot.scatter(df, "Petal.Width", "Sepal.Width", "Species", "Largura de Pétala", "Largura de Sépala", "Espécie")
    ggplotly(plot)
  })
}