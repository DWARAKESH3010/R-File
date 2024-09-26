data = read.csv("Chennai house data.csv")
head(data)
#View(data)
dim(data)
summary(data)


#data = na.omit(data)    #delete the missing value

#mean(data$age, na.rm = TRUE) #na.rm will remove the missing vslues


#data$price

data$age[is.na(data$age)] <- mean(data$age,na.rm = TRUE)    #missing values

#sum(is.na(data$age))

#sum(is.na(data$bathroom))

data$bathroom <- NULL    #delete the drop column
head(data)

sum(is.na(data))

boxplot(data$price)


q1 = quantile(data$price,0.25)
q1

q3 = quantile(data$price,0.75)
q3

iqr = q3 - q1

upper = q3 + 1.5 * iqr
lower = q1 - 1.5 * iqr

data$price[data$price<lower]<- lower
data$price[data$price > upper] <- upper

boxplot(data$price)


boxplot(data$area)


q1 = quantile(data$area,0.25)
q1

q3 = quantile(data$area,0.75)
q3

iqr = q3 - q1

upper = q3 + 1.5 * iqr
lower = q1 - 1.5 * iqr

data$area[data$area<lower]<- lower
data$area[data$area > upper] <- upper

boxplot(data$area)

boxplot(data$age)


q1 = quantile(data$age,0.25)
q1

q3 = quantile(data$age,0.75)
q3

iqr = q3 - q1

upper = q3 + 1.5 * iqr
lower = q1 - 1.5 * iqr

data$age[data$age<lower]<- lower
data$age[data$age > upper] <- upper

boxplot(data$age)

data      #after preprocess


# Convert x to a factor
data$status <- as.numeric(factor(data$status))

# Print the factor
head(data$status)


data$location <- as.numeric(factor((data$location)))
head(data$location)


data$builder <- as.numeric(factor((data$builder)))
head(data$builder)

head(data)

model = lm(data$price ~ data$area+data$status+data$bhk+data$age+data$location+data$builder,data = data)

summary(model)


residuals <- data$price - predict(model)

mse <- mean(residuals^2)


rmse <- sqrt(mse)


mae <- mean(abs(residuals))

mse
rmse
mae

summary(model)$r.squared*100

