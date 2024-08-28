n = 10
fact = 1
for (i in 1:n){
  print(fact)
  fact = fact * i
  if(fact > n){
    break
  }
}

