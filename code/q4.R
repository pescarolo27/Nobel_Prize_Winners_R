#Q4 -- Who was the first woman to receive a Nobel Prize, and in what category?

q4_data <- nobel %>%
  filter(sex == "Female") %>%
  #sort chronologically over time
  arrange(year) %>%
  #select variables of relevance
  select(year:prize, prize_share, full_name:sex)
q4_data
  #65 observations, 9 variables

#assigned specified variables
first_woman_name <- q4_data[1,]$full_name
first_woman_name
  #Output: "Marie Curie, née Sklodowska"
first_woman_category <- q4_data[1,]$category
first_woman_category
  #Output: "Physics"