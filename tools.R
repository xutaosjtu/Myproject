cost = function(x,...){
  if(x==1){
    price = rnorm(5, ...)
    price = abs(price)
  }
  else{
    price = NA
  }
  return(price)
}

extract = function(m, start, dest, ...){
  index = which(!is.na(m), arr.ind=T)
   data = data.frame(
     City.start = rep(start[index[,1]], each = 5), 
     City.end = rep(dest[index[,2]], each = 5),
     Price = unlist(m[which(!is.na(m))])
   )
  return(data)
}
