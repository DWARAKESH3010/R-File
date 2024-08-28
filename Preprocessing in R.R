data(iris)

# Check for duplicates
duplicates <- duplicated(iris)
sum(duplicates)

# Remove duplicates
iris <- iris[!duplicates, ]

#missing value
missing_values <- sum(is.na(iris))
print(missing_values)

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

iris[, 1:4] <- lapply(iris[, 1:4], capped_values)

head(iris)


#Data transform

# Standardization function
standardize <- function(x) {
  return ((x - mean(x)) / sd(x))
}

iris_standardized <- as.data.frame(lapply(iris[, 1:4], standardize))

iris_standardized$Species <- iris$Species


head(iris_standardized)


#class imbalance

class_distribution <- table(iris$Species)
print(class_distribution)


barplot(class_distribution, 
        main="Class Distribution in Iris Dataset", 
        col=c("lightblue", "lightgreen", "lightpink"),
        xlab="Species", 
        ylab="Frequency")


