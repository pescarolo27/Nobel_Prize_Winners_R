#Q3 -- What decade and category pair had the highest proportion of female laureates?
#this question feeds off the data from Q2, can use "data_mod_q2"

q3_data <- data_mod_q2 %>%
  filter(sex == "Female") %>%
  #there are only 65 Female-laureate observations in the dataset
  group_by(decade, category) %>%
  #obtain # & proportion of such laureates per decade, category
  summarize(num = n(), prop = n()/65) %>%
  ungroup() %>%
  #sort in descending order
  arrange(desc(num)) %>%
  #check that all 'prop' values add to 100% -- GOOD
  mutate(sum_prop = sum(prop))
q3_data
  #38 observations, 5 variables

#assign specified variable
max_female_list <- list(as.integer(str_replace(q3_data[1,]$decade, "-[0-9]{4}", "")), q3_data[1,]$category)
max_female_list
  #Output (2 elements): [2010, "Peace"]