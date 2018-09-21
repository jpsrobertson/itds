# setup -------------------------------------------------------------------

library(threejs)
library(tidyverse)


# data --------------------------------------------------------------------

# make sure species is not a factor variable

iris_df <- iris %>%
  mutate(Species = as.character(Species))


# colour vector -----------------------------------------------------------

recode_flowers <- function(x) {
  for (i in 1:length(x)) {
    if (x[i] == "setosa") {
      x[i] <- "red"
    }
    else if (x[i] == "versicolor") {
      x[i] <- "blue"
    }
    else {
      x[i] <- "green"
    }
  }
  x
}


flower_colours <- recode_flowers(iris_df$Species)


# plotting ----------------------------------------------------------------

scatterplot3js(x =iris_df$Sepal.Length
               , y = iris_df$Sepal.Width
               , z = iris_df$Petal.Length
               , color = flower_colours
               , axisLabels = c("Sepal Length"
                                , "Sepal Width"
                                , "Petal Length"))
