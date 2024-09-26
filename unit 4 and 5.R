#unit 4


matrix(sample(1:100,12),nrow = 3,ncol = 4)

sample(1:100,12)


df <- data.frame(
  col1 = 1:10,
  col2 = letters[1:10],
  col3 = seq(10, 100, by = 10),
  col4 = c(25, 30, 10, 35, 28, 40, 31, 24, 29, 33)
)
df
sort(df$col4)     #sort the value

order(df$col4)      #tells the index value


df[df$col1 >= 5,]

na.omit(df)

df$col4 = sort(df$col4)
df$col4
df

df1 <- data.frame(
  col1 = 1:10,
  colum2 = letters[1:10],
  colum3 = seq(10, 100, by = 10),
  colum4 = c(25, 30, 10, 35, 28, 40, 31, 24, 29, 33)
)
df1

df2 = merge(x = df,y = df1,by = "col1")
print(df2)



#unit 5
plot(data$price,predict(model))

abline(model)

boxplot(data$price,factor(data$location))
data$location

hist(data$area)


pairs(data[ c("price", "bhk", "area")], 
      main = "Pairwise Scatterplots",
      pch = 19, 
      col = "blue")
