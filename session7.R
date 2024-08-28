#creation of the list
l = list("a","b","c","d")
print(l)
is.list(l)

#addtion of the elemnet 
l = append(l,c("e","f","g","h"))
print(l)

#adding the element in between the index
l = append(l,"ccc",after = 3)
print(l)

#adding the element in begin the index
l = append(l,"yyy",after = 1)
print(l)

#named vector
v = c("a" = 1,"b" = 2,"c" = 3)
print(v["a"])