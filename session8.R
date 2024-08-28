library(lattice)
library(datasets)

class(mtcars)
dim(mtcars)
head(mtcars)
length(colnames(mtcars))
rownames(mtcars)
str(mtcars)
unique(mtcars$gear)

gear_tab = table(mtcars$gear)
gear_tab

histogram(~wt, data = df)

xyplot(wt ~ mpg, data = df)