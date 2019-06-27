
df <- iris
especies <- unique(df$Species)
main.color <- "#42c2f5"
div.color <- "white"

plot.histogram <- function(df, var, xlab, ylab) {
  out <- ggplot(df, aes_string(x = var)) +
    geom_histogram(bins = 15, fill = main.color, color = div.color, alpha = 0.7) +
    labs(x = xlab, y = ylab)
  return(out)
}

plot.scatter <- function(df, var.x, var.y, c.factor, xlab, ylab, lname) {
  ggplot(df, aes_string(x = var.x, y = var.y, color = c.factor)) +
    geom_point() +
    labs(x = xlab, y = ylab) +
    scale_color_discrete(name = lname)
}









