# what subjects are the most checked out items about? Are there subjects that are noticeably most popular, or is a mix?

library(tidyverse)
library(scales)

# downloading data

spl_df_complete <- read.csv("2017-checkouts.csv")

# adding column with dates

spl_df <- spl_df_complete %>% 
  filter(MaterialType != "MIXED") 

spl_df <- spl_df %>% 
  mutate(spl_df, date = paste0(CheckoutYear, "-0", CheckoutMonth, "-", "01"))

dates <- spl_df$date

spl_df$date <- as.Date(spl_df$date, "%Y-%m-%d")


# making a dataframe with selected columns

selected_spl_df <- spl_df %>% 
  select(Title, Subjects, UsageClass, Checkouts, date)


# switch from fiction and nonfiction to digital and physical. see if the charts look different. 

# then pick a third question for a third viz

# finish summary info 

# remove code

# finish intro

# write about background data 
  



