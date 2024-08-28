# dataframe manipilation
rno = 1001:1004
name = c("dwara","harsha","dgvc","mgr")
df = data.frame(rno,name)
df
# add of the one new row
# using rbind()
l = list(1005,"jumbo")
df1 = rbind(df,l)
df1
# add of the one row using nrow() method
nrow(df1)
ncol(df1)
df1[nrow(df1)+1,] = l
df1

mark1 = c(75,65,89,57)
mark2 = c(73,75,85,69)
df7 = data.frame(mark1,mark2)
df7
df10 = cbind(df,df7)
df10
iris

sapply(df,class)





