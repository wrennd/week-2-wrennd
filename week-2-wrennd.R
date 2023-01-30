library(tidyverse)
library(haven)

data <- read_dta("IAHR52FL.dta")
View(IAHR52FL)

new_df <- data %>% # separate 1: create limited view data frame
  select(hhid:hv208, hv270)

edu_df <- data %>% # education in single years
  select(hhid, hvidx_01:hvidx_35, hv108_01:hv108_35)
fem_df <- data %>% # female anthropometric
  select(hhid, ha0_01:ha6_11)
male_df <- data %>% #male anthropometric
  select(hhid, starts_with("hb"), -(hb11_01:hb62x_18))

# wrangling education data

edu_small <- edu_df %>%
  gather(key = "HOUSEHOLD", value = "EDUCATION", 2:71) %>%
  separate(HOUSEHOLD, into = c("household", "roster number"), sep = " ")
  