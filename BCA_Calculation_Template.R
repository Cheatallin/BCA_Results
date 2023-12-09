library(readxl)
library(summarytools)
library(skimr)
library(jtools)
# library(car)
library(packHV)
library(psych)
library(haven)
library(epiR)
library(survival)
library(date)
library(biostat3)
library(interactions)
library(hash)
library(hashmap)
library(ggplot2)

# Reading .xlsx file
BCA1 = read_xlsx("xlsx_path")
BCA1

# Calculating each readings means
Blank <- mean(BCA1$Blank)
C005 <- mean(BCA1$'0.05g/l')
C01 <- mean(BCA1$'0.1g/l')
C02 <- mean(BCA1$'0/2g/l')
C04 <- mean(BCA1$'0/4g/l')
Unk1 <- mean(BCA1$'Sample1')
Unk2 <- mean(BCA1$'Sample2')

# Deplete blank from each readings
C005_mod <- (C005 - Blank)
C01_mod <- (C01 - Blank)
C02_mod <- (C02 - Blank)
C04_mod <- (C04 - Blank)
Unk1_mod <- (Unk1 - Blank)
Unk2_mod <- (Unk2 - Blank)

# Creating data frame for standard line
BCA_Line <- data.frame("Abs" = c(C005_mod, C01_mod, C02_mod, C04_mod),
                        "Conc" = c("0.05", "0.1", "0.2", "0.4"))
BCA_Line

BCA_Line$Abs <- as.numeric(BCA_Line$Abs)
BCA_Line$Conc <- as.numeric(BCA_Line$Conc)
# Creating Standard Curve
Std_Line = lm(formula = BCA_Line$Conc ~ BCA_Line$Abs)
# To show the gradient and intercept of linear regression model
Std_Line

# To check the R-square and p-value of linear regression model
summary(Std_Line)

# If R-square and p-value is alright then proceed to calculation of unknown products
Unk1_C <- Unk1_mod * Std_Line$coefficients[[2]] + Std_Line$coefficients[[1]]
Unk2_C <- Unk2_mod * Std_Line$coefficients[[2]] + Std_Line$coefficients[[1]]
Unk1_C
Unk2_C

# create scatterplot with fitted regression line
BCA_Graph <- ggplot(BCA_Line, aes(x = BCA_Line$Conc, y = BCA_Line$Abs)) +
  geom_point(aes(size = 2.0)) +
  stat_smooth(method = "lm") +
  ggtitle("BSA Standard Line") +
  geom_vline(xintercept = 0.05) +
  geom_hline(yintercept = 0) +
  xlab("BSA Concentration (g/l)") +
  ylab("Absorbance")
BCA_Graph

# Save the graph from last time
ggsave("BCA_Graph.jpg")
