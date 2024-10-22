df = datasets::mtcars
head(df)
names(df)

sum(is.na(df))     #no missing values

df$mpg[2] = NA

df$cyl[2] = NA

df$mpg[is.na(df$mpg)] <- mean(df$mpg,na.rm = TRUE)
df$cyl[is.na(df$cyl)] <- mean(df$cyl,na.rm = TRUE)

boxplot(df$hp)

boxplot(df$wt)

boxplot(df$qsec)

boxplot(df$carb)


fun = function(i){
  q1 = quantile(x = i,0.25)
  q3 = quantile(x = i,0.75)
  
  iqr = q3 - q1
  
  lower = q1 - 1.5 * iqr
  higher = q3 + 1.5 * iqr
  
  i[i < lower] <- lower
  i[i > higher] <- higher
  
  return(i)
}

df$hp <- fun(df$hp)

boxplot(df$hp)


df$wt <- fun(df$wt)

boxplot(df$wt)


df$qsec <- fun(df$qsec)

boxplot(df$qsec)


df$carb <- fun(df$carb)

boxplot(df$carb)


# ploting

plot(df$mpg, df$disp, 
     main = "Scatter Plot of MPG vs HP", 
     xlab = "Miles Per Gallon (MPG)", 
     ylab = "Horsepower (HP)", 
     pch = 19, 
     col = "blue")

     # hist plot
hist(df$mpg)

boxplot(df$wt)

plot(df$wt, df$mpg,type = "l")

barplot(df$gear,df$mpg)




# sleep dataset


df = datasets::sleep
head(df)

sum(is.na(df))

df$extra[2] <- NA

df$extra[is.na(df$extra)] <- mean(df$extra,na.rm = TRUE)


# no outliers

boxplot(df$group)


barplot(height = df$extra[1:6],names.arg = df$Id[1:6])

# Histogram of Extra Sleep
hist(sleep$extra,
     main = "Histogram of Extra Sleep",
     xlab = "Extra Sleep (minutes)",
     col = "lightyellow",
     border = "black")

# Stripchart of Extra Sleep by Group
stripchart(extra ~ group, data = sleep,
           main = "Stripchart of Extra Sleep by Group",
           xlab = "Group (1: Treatment, 2: Control)",
           ylab = "Extra Sleep (minutes)",
           method = "jitter", pch = 19, col = "blue", vertical = TRUE)






df = datasets::trees
head(df)

sum(is.na(df))

df$Girth[2] <- NA

df$Girth[is.na(df$Girth)] <- mean(df$Girth,na.rm = TRUE)

boxplot(df$Volume)


fun = function(i){
  q1 = quantile(x = i,0.25)
  q3 = quantile(x = i,0.75)
  
  iqr = q3 - q1
  
  lower = q1 - 1.5 * iqr
  higher = q3 + 1.5 * iqr
  
  i[i < lower] <- lower
  i[i > higher] <- higher
  
  return(i)
}
df$Volume <- fun(df$Volume)

boxplot(df$Volume)


cor(df)

summary(df)

# Load the trees dataset
data(trees)

# Create a scatter plot
plot(df$Girth, trees$Volume,
     main = "Scatter Plot of Girth vs. Volume",
     xlab = "Girth (inches)",
     ylab = "Volume (cubic feet)",
     col = "blue", pch = 19) # pch controls the point shape

boxplot(df$Volume)

pairs(df)

plot(df$Girth,df$Volume,type = "l")
