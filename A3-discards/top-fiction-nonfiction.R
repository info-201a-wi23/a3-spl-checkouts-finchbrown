

# seeing if every book is either listed as nonfiction or fiction

total_rows <- nrow(selected_spl_df)

selected_spl_df$Subjects <- tolower(selected_spl_df$Subjects)

fiction_df <- selected_spl_df %>% 
  filter(grepl("fiction", Subjects))

n_fiction <- nrow(fiction_df)

nonfiction_df <- selected_spl_df %>% 
  filter(grepl("nonfiction", Subjects))

n_nonfiction <- nrow(nonfiction_df)

# see if proportion of fiction and nonfiction has changed since covid

fiction_per_day_2 <- fiction_df %>% 
  group_by(date) %>% 
  filter(Checkouts > 399) %>% 
  summarize(daily_fiction = sum(Checkouts))

nonfiction_per_day_2 <- nonfiction_df %>% 
  group_by(date) %>% 
  filter(Checkouts > 399) %>% 
  summarize(daily_nonfiction = sum(Checkouts))

chart_two_df <- left_join(fiction_per_day_2, nonfiction_per_day_2)

second_chart <- ggplot(chart_two_df) +
  geom_line(aes(x = date, y = daily_fiction, color = "Fiction")) +
  scale_y_continuous(labels = label_number_si(),
                     limits = c(0, 20000)) +
  geom_line(aes(x = date, y = daily_nonfiction, color = "Nonfiction")) +
  scale_y_continuous(labels = label_number_si(),
                     limits = c(0, 20000)) +
  labs(title = "Monthly Library Checkouts:",
       subtitle = "Only More Popular Items",
       x = "Date",
       y = "Number of Checkouts",
       color = "Genre") +
  scale_colour_manual("", 
                      breaks = c("Fiction", "Nonfiction"),
                      values = c("#7F00FF", "#228B22"))

second_chart
