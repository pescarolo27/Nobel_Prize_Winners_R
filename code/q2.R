#Q2 -- What decade had the highest proportion of US-born winners?

#need to make a new column denoting the decade of the year, which spans from 1901-2023
data_mod_q2 <- nobel %>%
  mutate(decade = case_when(year<1910 ~ "1900-1909", year>1909 & year<1920 ~ "1910-1919", 
                            year>1919 & year<1930 ~ "1920-1929", year>1929 & year<1940 ~ "1930-1939", 
                            year>1939 & year<1950 ~ "1940-1949", year>1949 & year<1960 ~ "1950-1959",
                            year>1959 & year<1970 ~ "1960-1969", year>1969 & year<1980 ~ "1970-1979", 
                            year>1979 & year<1990 ~ "1980-1989", year>1989 & year<2000 ~ "1990-1999",
                            year>1999 & year<2010 ~ "2000-2009", year>2009 & year<2020 ~ "2010-2019", year>2019 ~ "2020-2029"))
#use this modified data for the purposes of Q2
q2_data <- data_mod_q2 %>%
  filter(birth_country == "United States of America") %>%
  #are 291 observations of laureates from the US
  group_by(decade) %>%
  #obtain # & proportion of such laureates per decade
  summarize(num = n(), prop = n()/291) %>%
  ungroup() %>%
  #sort in descending order
  arrange(desc(num)) %>%
  #check to ensure that the new 'prop' column sums to 100% -- GOOD
  mutate(sum_prop=sum(prop))
q2_data
  #13 observations, 4 variables

#assign the specified variable -- 2000-2009
max_decade_usa <- as.integer(str_replace(q2_data[1,]$decade, "-[0-9]{4}", ""))
max_decade_usa
  #Output: 2000