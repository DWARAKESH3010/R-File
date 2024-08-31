data(airquality)

head(airquality)

summary(airquality)

colnames(airquality)

colSums(is.na(airquality))

dim(airquality)







# Univariate Analysis

hist(airquality$Ozone)

boxplot(airquality$Solar.R,main="Boxplot of Solar.R", 
        ylab="Solar.R")

plot(density(airquality$Wind),col = "red",lwd=2)


# Bivariate Analysis

plot(airquality$Ozone,airquality$Temp)

boxplot(airquality$Month ~ airquality$Day)

# Multivariate Analysis

pairs(airquality[, 1:6], 
      main="Pairs Plot of airquality Dataset", 
      col=airquality$Ozone,pch = 20)


cor_matrix <- cor(airquality[, 1:6])
print(cor_matrix)

heatmap(cor_matrix, 
        main="Heatmap of Correlation Matrix", 
        col=topo.colors(10))


#preprocessing 

data(airquality)

# Check for duplicates
duplicates <- duplicated(airquality)
sum(duplicates)

#missing value
missing_values <- sum(is.na(airquality))
print(missing_values)

airquality$Ozone[is.na(airquality$Ozone)] <- mean(airquality$Ozone, na.rm = TRUE)

airquality$Solar.R[is.na(airquality$Solar.R)] <- mean(airquality$Solar.R, na.rm = TRUE)

colSums(is.na(airquality))

#outlier

capped_values <- function(x) {
  Q1 <- quantile(x, 0.25)
  Q3 <- quantile(x, 0.75)
  IQR <- Q3 - Q1
  lower_bound <- Q1 - 1.5 * IQR
  upper_bound <- Q3 + 1.5 * IQR
  x[x < lower_bound] <- lower_bound
  x[x > upper_bound] <- upper_bound
  return(x)
}

airquality[, 1:6] <- lapply(airquality[, 1:6], capped_values)

head(airquality)


#Data transform

# Standardization function
standardize <- function(x) {
  return ((x - mean(x)) / sd(x))
}

airquality_standardized <- as.data.frame(lapply(airquality[, 1:6], standardize))

airquality_standardized$Ozone <- airquality$Ozne


head(airquality_standardized)



#class imbalance
class_distribution <- table(airquality$Month)
print(class_distribution)


barplot(class_distribution, main="Class Distribution in airquality Dataset", 
        col=c("lightblue", "lightgreen", "lightpink"),
        xlab="Month", ylab="Frequency")
