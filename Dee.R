# Loading tidyverse
library(tidyverse)


# Importing the dataset
dataset = read.csv('train_1.csv')

# Coerce into tibble
dataset2 <- as_tibble(dataset)
format(object.size(dataset2), units = 'auto')

# Change variables & observations
# Gather dates
dataset3 <- dataset2 %>% 
  gather(key = date, value = traffic, -Page)

format(object.size(dataset3), units = 'auto')

# Transform dates to dates
library(lubridate)
library(stringr)
dataset3$date <- str_replace_all(dataset3$date, "X", "")
dataset3$date <- ymd(dataset3$date)

dataset3 <- dataset3 %>% arrange(Page)