


first_chart <- ggplot(chart_one_df) +
  geom_line(aes(x = date, y = daily_fiction, color = "Fiction")) +
  scale_y_continuous(labels = label_number_si(),
                     limits = c(0, 300000)) +
  geom_line(aes(x = date, y = daily_nonfiction, color = "Nonfiction")) +
  scale_y_continuous(labels = label_number_si(),
                     limits = c(0, 300000)) +
  labs(title = "Fiction Versus Nonfiction Checkouts",
       caption = "From the Seattle Public Libraries, 2017-2023",
       x = "Date",
       y = "Number of Checkouts",
       color = "Genre") +
  scale_colour_manual("Genre", 
                      breaks = c("Fiction", "Nonfiction"),
                      values = c("#DA70D6", "#808080"))

first_chart




