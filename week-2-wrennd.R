library(tidyverse)
library(haven)

data <- read_dta("IAHR52FL.dta")

small_df <- data %>% #restricting sample pool to 10%
  slice_sample(prop = 0.1)

new_df <- small_df %>% # separate 1: create limited view data frame
  select(hhid:hv208, hv270)

edu_df <- small_df %>% # education in single years
  select(hhid, hvidx_01:hvidx_35, hv108_01:hv108_35)
fem_df <- small_df %>% # female anthropometric
  select(hhid, ha0_01:ha6_11)
male_df <- small_df %>% #male anthropometric
  select(hhid, starts_with("hb"), -(hb11_01:hb62x_18))

# wrangling education data

edu_small <- edu_df %>%
  gather(key = "HOUSEHOLD", value = "education", 2:71)%>%
  separate(HOUSEHOLD, into = c("household", "roster"), sep = "_")%>%
  spread(key = roster, value = education) %>%
  

# wrangling fem_df

fem_small <- fem_df %>%
  gather(key = "houshold", value = "n", 2:78) %>%


# wrangling 

male_small <- male_df %>%
  gather(key = "houshold", value = "n", 2:127) 
