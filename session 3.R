#largerst three numbers
a = 100
b = 1200
c = 300
if ((a > b)&&(a > c))
{
  print(paste(a," is the greatest number"),quote = FALSE)
}else if((b > a)&&(b > c)){
  print(paste(b," is the greatest number"),quote = FALSE)
}else{
  print(paste(c," is the greatest number"),quote = FALSE)
}

#factorials
n = 10
fact = 1
for (i in 1:n)
{
  print(fact*i)
  fact = fact + 1
}

#factors

n = 100
for (i in 1:n)
{
  if((n %% i == 0))
  {
    print(i)
  }
}

#odd or even
n = 11
even = c()
odd = c()
for (i in 1:n)
{
  if(i %% 2 == 0)
  {
    even = c(even,i)
    
  }else{
    odd = c(odd, i)
  }
}
print(paste("even number are: ",even))
print(paste("odd number are:",odd))

#count the odd and even numnber 
n = 11
even = c()
odd = c()
for (i in 1:n)
{
  if(i %% 2 == 0)
  {
    even = c(even,i)
    
  }else{
    odd = c(odd, i)
  }
}
print(length(paste("even",even)))
print(length(paste("odd",odd)))

#prime number

n <- 111

for (i in 3:n) {
  is_prime <- TRUE
  for (j in 2:(i - 1)) {
    if (i %% j == 0) {
      is_prime <- FALSE
      break  # Exit the inner loop if a divisor is found
    }
  }
  if (is_prime) {
    print(i)
  }
}


