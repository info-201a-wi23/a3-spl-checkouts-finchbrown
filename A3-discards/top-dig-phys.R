

# dividing physical and digital items

physical_df <- selected_spl_df %>% 
  filter(grepl("Physical", UsageClass))

digital_df <- selected_spl_df %>% 
  filter(grepl("Digital", UsageClass))


# see how proportion of digital and physical items has changed since Covid

# filtering data for only most popular items

physical_per_day_2 <- physical_df %>% 
  group_by(date) %>% 
  filter(Checkouts > 399) %>% 
  summarize(daily_physical = sum(Checkouts))

digital_per_day_2 <- digital_df %>% 
  group_by(date) %>% 
  filter(Checkouts > 399) %>% 
  summarize(daily_digital = sum(Checkouts))

dig_phys_df_2 <- left_join(physical_per_day_2, digital_per_day_2)

# making a chart

dig_phys_chart_2 <- ggplot(dig_phys_df_2) +
  geom_line(aes(x = date, y = daily_physical, color = "Physical")) +
  scale_y_continuous(labels = label_number_si(),
                     limits = c(0, 20000)) +
  geom_line(aes(x = date, y = daily_digital, color = "Digital")) +
  scale_y_continuous(labels = label_number_si(),
                     limits = c(0, 20000)) +
  labs(title = "Library Checkouts Per Month from 2017 to 2023",
       subtitle = "Digital Vs Physical Items",
       x = "Date",
       y = "Number of Checkouts",
       color = "Item Type") +
  scale_colour_manual("", 
                      breaks = c("Physical", "Digital"),
                      values = c("#7F00FF", "#228B22"))

dig_phys_chart_2

# making a chart to show overall checkouts versus checkouts of popular items









