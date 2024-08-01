data <- read.csv("dataset1.csv")
model <- aov(Mileage ~ Company, data = data)
pairwise_results <- pairwise.t.test(data$Mileage, data$Company, p.adjust.method = "none")

summary(model)
pairwise_results

library(dplyr)
group_by(data, Company) %>%
  summarise(
    count = n(),
    mean = mean(Mileage, na.rm = TRUE),
    median = median(Mileage, na.rm = TRUE),
    sd = sd(Mileage, na.rm = TRUE),
    var = var(Mileage, na.rm = TRUE)
  )
boxplot(data$Mileage ~ data$Company, main = "Mileage vs Company")