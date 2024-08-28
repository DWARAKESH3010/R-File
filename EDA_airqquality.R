data(airquality)

head(airquality)

summary(airquality)

colnames(airquality)

colSums(is.na(airquality))

dim(airquality)

airquality$Ozone[is.na(airquality$Ozone)] <- mean(airquality$Ozone, na.rm = TRUE)

airquality$Solar.R[is.na(airquality$Solar.R)] <- mean(airquality$Solar.R, na.rm = TRUE)

colSums(is.na(airquality))




# Univariate Analysis

hist(iris$Sepal.Width)

boxplot(iris$Petal.Length,main="Boxplot of Sepal Length", 
        ylab="Sepal Length")

plot(density(iris$Petal.Width),col = "red",lwd=2)


# Bivariate Analysis

plot(iris$Sepal.Length,iris$Petal.Length)

boxplot(iris$Sepal.Length ~ iris$Species)

# Multivariate Analysis

pairs(iris[, 1:4], 
      main="Pairs Plot of Iris Dataset", 
      col=iris$Species,pch = 20)


cor_matrix <- cor(iris[, 1:4])
print(cor_matrix)

heatmap(cor_matrix, 
        main="Heatmap of Correlation Matrix", 
        col=topo.colors(10))



