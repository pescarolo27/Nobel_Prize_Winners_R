#load in libraries
library(tidyverse)
library(dplyr)
library(readr)
library(ggplot2)

#read in the data
nobel <- read_csv("nobel.csv")
#glimpse(nobel)

#Q1 -- What is the most commonly awarded gender and birth country?

#count # sex-birth_country pairs
q1_data <- nobel %>%
  group_by(sex, birth_country) %>%
  summarize(num = n()) %>%
  ungroup() %>%
  arrange(desc(num))
  #154 observations, 3 variables

top_gender <- q1_data[1,]$sex
top_country <- q1_data[1,]$birth_country
print(top_gender)
  #Output: "Male"
print(top_country)
  #Output: "United States of America"