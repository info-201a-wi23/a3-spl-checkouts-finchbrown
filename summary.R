# peak of overall checkouts versus most current statistic

  # finding peak

overall_items <- selected_spl_df %>% 
  group_by(date) %>% 
  summarize(overall_daily_checkouts = sum(Checkouts))

overall_items <- na.omit(overall_items)

max_checkouts <- overall_items %>% 
  filter(overall_daily_checkouts == max(overall_daily_checkouts)) %>% 
  pull(overall_daily_checkouts)

max_checkouts <- format(max_checkouts, big.mark = ",", scientific = FALSE)

  # finding date of peak

max_checkouts_date <- overall_items %>% 
  filter(overall_daily_checkouts == max(overall_daily_checkouts)) %>% 
  pull(date)

# finding peak before Covid

pre_covid <- overall_items %>% 
  filter(date == "2020-01-01") %>% 
  pull(overall_daily_checkouts)

pre_covid <- format(pre_covid, big.mark = ",", scientific = FALSE)

  # finding most recent data

latest_checkouts <- overall_items %>% 
  filter(date == max(date)) %>% 
  pull(overall_daily_checkouts)

latest_checkouts <- format(latest_checkouts, big.mark = ",", scientific = FALSE)

latest_checkouts_date <- overall_items %>% 
  filter(date == max(date)) %>% 
  pull(date)

# peak of nonfiction checkouts versus most current

  # setting things up

    # seeing if every book is either listed as nonfiction or fiction

total_rows <- nrow(selected_spl_df)

selected_spl_df$Subjects <- tolower(selected_spl_df$Subjects)

fiction_df <- selected_spl_df %>% 
  filter(grepl("fiction", Subjects))

n_fiction <- nrow(fiction_df)

nonfiction_df <- selected_spl_df %>% 
  filter(grepl("nonfiction", Subjects))

n_nonfiction <- nrow(nonfiction_df)

    # see if proportion of fiction and nonfiction has changed since          covid

fiction_per_day <- fiction_df %>% 
  group_by(date) %>% 
  summarize(daily_fiction = sum(Checkouts))

nonfiction_per_day <- nonfiction_df %>% 
  group_by(date) %>% 
  summarize(daily_nonfiction = sum(Checkouts))

chart_one_df <- left_join(fiction_per_day, nonfiction_per_day)

chart_one_df <- na.omit(chart_one_df)

# all set up, now finding summary statistics

max_nonfiction <- chart_one_df %>% 
  filter(daily_nonfiction == max(daily_nonfiction)) %>% 
  pull(daily_nonfiction)

max_nonfiction <- format(max_nonfiction, big.mark = ",", scientific = FALSE)

max_nonfiction_date <- chart_one_df %>% 
  filter(daily_nonfiction == max(daily_nonfiction)) %>% 
  pull(date)
  
latest_nonfiction <- chart_one_df %>% 
  filter(date == max(date)) %>% 
  pull(daily_nonfiction)

latest_nonfiction <- format(latest_nonfiction, big.mark = ",", scientific = FALSE)
  
latest_nonfiction_date <- chart_one_df %>% 
  filter(date == max(date)) %>% 
  pull(date)


# finding date that physical checkouts hit zero 

  # setting up

    # putting together dataframe of physical and digital checkouts

physical_df <- selected_spl_df %>% 
  filter(grepl("Physical", UsageClass))

digital_df <- selected_spl_df %>% 
  filter(grepl("Digital", UsageClass))


    # grouping dataframes by date

physical_per_day <- physical_df %>% 
  group_by(date) %>% 
  summarize(daily_physical = sum(Checkouts))

digital_per_day <- digital_df %>% 
  group_by(date) %>% 
  summarize(daily_digital = sum(Checkouts))

    # joining dataframes

dig_phys_df <- left_join(physical_per_day, digital_per_day)

  # finding summary stats

pre_covid_physical <- dig_phys_df %>% 
  filter(date == "2020-01-01") %>% 
  pull(daily_physical)

pre_covid_physical <- format(pre_covid_physical, big.mark = ",", scientific = FALSE)

min_physical <- dig_phys_df %>% 
  filter(daily_physical == min(daily_physical)) %>% 
  pull(daily_physical)

min_physical_date <- dig_phys_df %>% 
  filter(daily_physical == min(daily_physical)) %>% 
  pull(date)
  
  