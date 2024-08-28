x = 1:100
y = 101:200
z = 201:300
df = data.frame(x,y,z)
head(df,10)
dim(df)
str(df)
#know the datatype
# of each columns
sapply(df,class)
#column name/index
names(df)
colnames(df)
#rownames/index
rownames(df)
df
df[1,1]
df[1,"x"]
df[1,3] = -999
df[1,3]
df[1:4,1:2]
df 
df1 = df
dim(df1)



