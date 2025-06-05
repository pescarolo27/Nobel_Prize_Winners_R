#Q5 -- Which individuals or organizations have won multiple Nobel Prizes throughout the years?

q5_data <- nobel %>%
  group_by(laureate_id) %>%
  #count # observations--# Nobel prize--per 'laureate_id'
  summarize(num_nobels = n()) %>%
  ungroup() %>%
  #filter for 'laureate_id's with multiple observations -- are 7 such id's
  filter(num_nobels>1) %>%
  #sort in descending order
  arrange(desc(num_nobels)) %>%
  #use a join to get other information (i.e. name, organization, ...)
  inner_join(nobel, by=c("laureate_id"))
q5_data
  #15 observations, 19 variables

#assign specified variable
repeats <- as.list(unique(q5_data$full_name))
repeats
  #Output (8 elements): ["Comité international de la Croix Rouge (International Committee of the Red Cross)",
    #"Marie Curie, née Sklodowska", "John Bardeen", "Linus Carl Pauling", "Frederick Sanger",
    #"Office of the United Nations High Commissioner for Refugees (UNHCR)",
    #"K. Barry Sharpless", "Barry Sharpless"]