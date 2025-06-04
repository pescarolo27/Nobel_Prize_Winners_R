#load in libraries
library(tidyverse)
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

top_gender <- q1_data[1,]$sex
top_country <- q1_data[1,]$birth_country
print(top_gender)
print(top_country)
