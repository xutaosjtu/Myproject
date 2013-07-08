cost = function(x,...){
  if(x==1){
    price = rnorm(50, ...)
    price = abs(price)
  }
  else{
    price = NA
  }
  return(price)
}
