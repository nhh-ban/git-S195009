# Create a histogram of galaxy sizes
ggplot(data = galaxies_page, aes(x = a_26)) +
  geom_bar(fill = "blue", color = "black") +
  labs(title = "Galaxy Size Distribution",
       x = "Galaxy Size (kpc)",
       y = "Count") +
  theme_minimal()
