

# see if proportion of fiction and nonfiction has changed since covid

popular_items <- selected_spl_df %>% 
  group_by(date) %>% 
  filter(Checkouts > 399) %>% 
  summarize(pop_daily_checkouts = sum(Checkouts))

overall_items <- selected_spl_df %>% 
  group_by(date) %>% 
  summarize(overall_daily_checkouts = sum(Checkouts))

overall_items <- na.omit(overall_items)

all_vs_pop_df <- left_join(popular_items, overall_items)

popularity_chart <- ggplot(all_vs_pop_df) +
  geom_line(aes(x = date, y = pop_daily_checkouts, 
                color = "Popular Items")) +
  scale_y_continuous(labels = label_number_si(),
                     limits = c(0, 350000)) +
  geom_line(aes(x = date, y = overall_daily_checkouts, 
                color = "All Items")) +
  scale_y_continuous(labels = label_number_si(),
                     limits = c(0, 350000)) +
  labs(title = "Overall Checkouts Versus 'Bestsellers'",
       caption = "From the Seattle Public Libraries, 2017-2023",
       x = "Date",
       y = "Number of Checkouts",
       color = "Popularity") +
  scale_colour_manual("Popularity", 
                      breaks = c("Popular Items", "All Items"),
                      values = c("#7F00FF", "#228B22"))

popularity_chart
