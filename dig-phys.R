


# plotting physical and digital data

dig_phys_chart <- ggplot(dig_phys_df) +
  geom_line(aes(x = date, y = daily_physical, color = "Physical")) +
  scale_y_continuous(labels = label_number_si(),
                     limits = c(0, 260000)) +
  geom_line(aes(x = date, y = daily_digital, color = "Digital")) +
  scale_y_continuous(labels = label_number_si(),
                     limits = c(0, 260000)) +
  labs(title = "Digital versus Physical Checkouts",
       caption = "From the Seattle Public Libraries, 2017-2023",
       x = "Date",
       y = "Number of Checkouts",
       color = "Item Type") +
  scale_colour_manual("Item Type", 
                      breaks = c("Physical", "Digital"),
                      values = c("#F4BB44", "#619CFF"))

?labs

dig_phys_chart




