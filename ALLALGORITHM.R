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




# k means algorithm

install.packages("ggplot2")

library(ggplot2)


k <- 3

set.seed(123)  

kmeans_result <- kmeans(airquality_standardized, centers = k)

print(kmeans_result)

kmeans_result$cluster

kmeans_result$centers

names(airquality_standardized)

airquality_standardized$cluster <- as.factor(kmeans_result$cluster)

# Plot Solar.r vs Temp with color based on clusters
library(ggplot2)
ggplot(airquality_standardized, aes(x = Solar.R, y = Temp, color = cluster)) +
  geom_point(size = 3) +
  labs(title = "K-means Clustering (Airquality Data)", x = "Ozone", y = "Temperature")

# Evaluate clustering performance
kmeans_result$tot.withinss

# Logitestic 

# Load necessary library
data("iris")

# Create a binary outcome variable: Setosa vs. Not Setosa
iris$SpeciesBinary <- ifelse(iris$Species == "setosa", 1, 0)

# Select predictors and the binary outcome variable
predictors <- iris[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")]
predictors$SpeciesBinary <- iris$SpeciesBinary

# Split the data into training and testing sets
set.seed(123)  # For reproducibility
train_indices <- sample(seq_len(nrow(predictors)), size = 0.7 * nrow(predictors))
train_data <- predictors[train_indices, ]
test_data <- predictors[-train_indices, ]

# Fit logistic regression model
logistic_model <- glm(SpeciesBinary ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
                      data = train_data, 
                      family = binomial)

# Predict and evaluate
predicted_probs <- predict(logistic_model, newdata = test_data, type = "response")
predicted_classes <- ifelse(predicted_probs > 0.5, 1, 0)
confusion_matrix <- table(Predicted = predicted_classes, Actual = test_data$SpeciesBinary)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

# Print results
print(confusion_matrix)
print(paste("Accuracy:", round(accuracy, 2)))



#decision tree
install.packages("rpart")
# Install and load necessary libraries
install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)

# Load the iris dataset
data("iris")

# Create a binary outcome variable: Setosa vs. Not Setosa
iris$SpeciesBinary <- ifelse(iris$Species == "setosa", 1, 0)

# Split the data into training and testing sets
set.seed(123)
train_indices <- sample(seq_len(nrow(iris)), size = 0.7 * nrow(iris))
train_data <- iris[train_indices, ]
test_data <- iris[-train_indices, ]

# Fit the CART decision tree model
cart_model <- rpart(SpeciesBinary ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
                    data = train_data, 
                    method = "class")

# Plot the tree
rpart.plot(cart_model)

# Predict and evaluate
predicted_classes <- predict(cart_model, newdata = test_data, type = "class")
confusion_matrix <- table(Predicted = predicted_classes, Actual = test_data$SpeciesBinary)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

# Print results
print(confusion_matrix)
print(paste("Accuracy:", round(accuracy, 2)))


#Bayes theroim

install.packages("e1071")
library(e1071)

# Install and load necessary library
install.packages("e1071")
library(e1071)

# Load the iris dataset
data("iris")

# Create a binary outcome variable: Setosa vs. Not Setosa
iris$SpeciesBinary <- ifelse(iris$Species == "setosa", "setosa", "not setosa")

# Select predictors and the binary outcome variable
predictors <- iris[, c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width")]
predictors$SpeciesBinary <- iris$SpeciesBinary

# Split the data into training and testing sets
set.seed(123)
train_indices <- sample(seq_len(nrow(predictors)), size = 0.7 * nrow(predictors))
train_data <- predictors[train_indices, ]
test_data <- predictors[-train_indices, ]

# Fit the Naive Bayes model
nb_model <- naiveBayes(SpeciesBinary ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
                       data = train_data)

# Predict and evaluate
predicted_classes <- predict(nb_model, newdata = test_data)
confusion_matrix <- table(Predicted = predicted_classes, Actual = test_data$SpeciesBinary)
accuracy <- sum(diag(confusion_matrix)) / sum(confusion_matrix)

# Print results
print(confusion_matrix)
print(paste("Accuracy:", round(accuracy, 2)))



#multi linear regression

# Load the airquality dataset
data("airquality")

# Clean the data by removing rows with missing values
airquality_clean <- na.omit(airquality)

# Select predictors and the outcome variable
predictors <- airquality_clean[, c("Solar.R", "Wind", "Temp", "Month", "Day")]
outcome <- airquality_clean$Ozone

# Combine predictors and outcome into a single dataframe for convenience
data <- data.frame(predictors, Ozone = outcome)

# Split the data into training and testing sets
set.seed(123)  # For reproducibility
train_indices <- sample(seq_len(nrow(data)), size = 0.7 * nrow(data))
train_data <- data[train_indices, ]
test_data <- data[-train_indices, ]

# Fit the Multiple Linear Regression model
mlr_model <- lm(Ozone ~ Solar.R + Wind + Temp + Month + Day, data = train_data)

# View the model summary
summary(mlr_model)

# Predict on the test data
predicted_values <- predict(mlr_model, newdata = test_data)

# Calculate performance metrics
actual_values <- test_data$Ozone
mse <- mean((predicted_values - actual_values)^2)  # Mean Squared Error
rmse <- sqrt(mse)  # Root Mean Squared Error

# Print results
print(paste("Mean Squared Error (MSE):", round(mse, 2)))
print(paste("Root Mean Squared Error (RMSE):", round(rmse, 2)))
