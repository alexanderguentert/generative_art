library(generativeart) # devtools::install_github("cutterkom/generativeart")
library(ambient)
library(dplyr)# set the paths
DIR <- "/home/alex/R/projekte/git/generative_art/"
# set the paths
IMG_DIR <- "/home/alex/R/projekte/git/generative_art/img/"
IMG_SUBDIR <- "everything/"
IMG_SUBDIR2 <- "handpicked/"
IMG_PATH <- paste0(IMG_DIR, IMG_SUBDIR)

LOGFILE_DIR <- "/home/alex/R/projekte/git/generative_art/logfile/"
LOGFILE <- "logfile.csv"
LOGFILE_PATH <- paste0(LOGFILE_DIR, LOGFILE)

# create the directory structure
generativeart::setup_directories(IMG_DIR, IMG_SUBDIR, IMG_SUBDIR2, LOGFILE_DIR)
# include a specific formula, for example:
my_formula <- list(
  x = quote(runif(1, -1, 10) * x_i^2 + sin(y_i^2)),
  y = quote(runif(1, -1, 10) * x_i^2 + cos(y_i^3))
  #x = quote(runif(1, -1, 10) * x_i^2 - sin(y_i^2)),
  #y = quote(runif(1, -1, 10) * y_i^3 +cos(x_i^3))
  #x = quote(runif(1, -1, 10) * x_i^2 - sin(y_i^2)),
  #y = quote(runif(1, -1, 10) * y_i^3 - cos(x_i^2) ) * y_i^4)
)# call the main function to create five images with a polar coordinate system
generativeart::generate_img(formula = my_formula, 
                            nr_of_img = 5, # set the number of iterations
                            polar = FALSE, 
                            filetype = "png", 
                            color = "#43085F", #"#1b2e3c", #"#c1a06e", 
                            background_color = "#DCC58D" # "#1a3657"
                            )



library(dplyr)
library(jasmines)
use_seed(1) %>%
  entity_gaussian(grain = 300) %>%
  unfold_tempest(iterations = 10) %>%
  unfold_tempest(
    iterations = 5,
    scale = .01
  ) %>%
  unfold_warp(
    iterations = 1,
    scale = .5, 
    output = "layer" 
  ) %>%
  style_ribbon(background = "wheat")
use_seed(1) %>%
  entity_gaussian(grain = 10) %>%
  #unfold_tempest(iterations = 10) %>%
  unfold_tempest(
    iterations = 5,
    scale = .01
  ) %>%
  unfold_warp(
  ) %>%
  style_ribbon(background = "wheat")
ggsave("jasmines/p1.png", p0, width = 20, height = 20, units = "in")


library(flametree)
# pick some colours
shades <- c("#1b2e3c", "#0c0c1e", "#74112f", "#f3e3e2")

# data structure defining the trees
dat <- flametree_grow(time = 8, trees = 10)

# draw the plot
dat %>% 
  flametree_plot(
    background = "antiquewhite",
    palette = shades, 
    style = "nativeflora"
  )