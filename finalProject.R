# Kai Bailey & Zhi Chen
# kaiba@uw.edu
# INFO 201 Au 2023 Section BB
# Final Project -- Data Wrangling

# Library statements
library(dplyr)
library(stringr)
library(ggplot2)

# Initialize the two datasets
census_df <- read.csv("ACSDP5Y2019.DP05-Data.csv")
housing_df <- read.csv("Unaffordable_Housing_(Current_Version).csv")

# Clean before joining just to make things easier.
census_df <- select(census_df, 
                    Census_Tract = GEO_ID,
                    Census_Name = NAME,
                    totalPop = DP05_0063E,
                    whitePop = DP05_0064E,
                    blackPop = DP05_0065E,
                    nativePop = DP05_0066E,
                    asianPop = DP05_0067E,
                    pacificPop = DP05_0068E,
                    otherPop = DP05_0069E,
                    total_units = DP05_0086E)

census_df$Census_Tract <- as.double(census_df$Census_Tract)

census_df <- mutate_at(census_df, vars(totalPop, whitePop, blackPop, nativePop, asianPop, 
                                       pacificPop, otherPop, total_units),
                       as.numeric)

# Join two datasets
df <- left_join(housing_df, census_df, by = "Census_Tract")

# New Numerical Column (Percentage of people who identify as Black)

df$Percentage_Black <- (df$blackPop / df$totalPop) * 100
mean_black_percentage <- mean(df$Percentage_Black, na.rm = TRUE)

# New Categorical Column (Gives a census tract a RANK (1-5) on the severity of the number of
# people spending above the 30% income threshhold on housing, 1 being low severity, 5 being extreme severity).
# These bins will be split in 5 different ways, using the min and max values for the percentage of people
# spending MORE than 30% of their income on housing. These bins will be split equally 5 ways.

df$Percentage <- as.numeric(df$Percentage)
valid_percentages <- df$Percentage[is.finite(df$Percentage)]


df$Ranking <- cut(df$Percentage, breaks = seq(min(valid_percentages), max(valid_percentages), length.out = 6), labels = c(1, 2, 3, 4, 5))

# Summarization Dataframe (Based off of the Rankings and Black Population Percentage)

summary_table <- df %>%
  filter(!is.na(Ranking)) %>%
  group_by(Ranking) %>%
  summarize(Mean_Percentage_Black = mean(Percentage_Black, na.rm = TRUE))

# Visualization

ranking_plot <- ggplot(summary_table, aes(x = as.factor(Ranking), y = Mean_Percentage_Black, fill = as.factor(Ranking))) +
  geom_bar(stat = "identity", color = "black") +
  geom_hline(aes(yintercept = mean_black_percentage, linetype = "Mean Percentage in Seattle"), color = "green", size = 1) +
  labs(title = "Mean Black Population Percentage by Severity Ranking",
       x = "Ranking (1 = low severity, 5 = high severity)",
       y = "Mean Black Population Percentage (by Census Tract)",
       caption = "Data source: Affordable Housing Data, ACS Census") +
  scale_fill_manual(values = c("1" = "#452d31ff", "2" = "#6c2f39ff", "3" = "#901f32ff", "4" = "#c70021ff", "5" = "#ff3355ff"), name = "Ranking") +
  scale_linetype_manual(values = c("Mean Percentage in Seattle" = "dotted"), name = "Mean Black Population Percentage") +
  theme_minimal()

print(ranking_plot)

