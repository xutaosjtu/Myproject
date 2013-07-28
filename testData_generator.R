N = 100



## within city
places = data.frame(name, price, time, start, end)

## assume the price is constant
hotel.mean = rnorm(10, mean = 50, sd =10)
hotel = sapply(hotel.mean, function(x) abs(rnorm(10, mean = x, sd = 5)))
rownames(hotel) = LETTERS[1:10]
colnames(hotel) = letters[1:10]

##Table of cities
city = LETTERS[1:10] # ten cities
Scene.name = sapply(city, function(x) paste(x, 1:10))
Scene.address = mapply(function(x) paste(x, letters[1]), Scene.name)
CITY = data.frame(city = rep(city, each = 10), Scene.name = as.vector(Scene.name), Scene.address, Scene.time = sample((1:10)/2, 100, replace=T))
write.csv(CITY, file = "cities.csv", row.names=F)

## Travel.plane
set.seed(10)
link.air = matrix(rbinom(100,1, 0.3), ncol = 10)
colnames(link.air) = LETTERS[1:10]
rownames(link.air) = LETTERS[1:10]
tmp = mapply(cost, mean = 100,link.air)
ticket.air  = matrix(tmp, ncol = 10)
TRAVEL.PLANE = extract(ticket.air, city, city)
write.csv(TRAVEL.PLANE, file="travel.plane.csv", row.names = F)

## Travel.train
set.seed(234)
link.train = matrix(rbinom(100,1, 0.3), ncol = 10)
colnames(link.train) = LETTERS[1:10]
rownames(link.train) = LETTERS[1:10]
tmp = mapply(cost, mean=50,link.train)
ticket.train  = matrix(tmp, ncol = 10)
TRAVEL.TRAIN = extract(ticket.train, city, city)
write.csv(TRAVEL.TRAIN, file="travel.train.csv", row.names = F)

## Travel.bus
link.bus = matrix(rep(1, 100), ncol = 10)
colnames(link.bus) = LETTERS[1:10]
rownames(link.bus) = LETTERS[1:10]
tmp = mapply(cost, mean = 30,link.bus)
ticket.bus = matrix(tmp, ncol = 10)
TRAVEL.BUS = extract(ticket.bus, city, city)
write.csv(TRAVEL.BUS, file="travel.bus.csv", row.names = F)

## Taxi
TAXI = data.frame(city, start = rnorm(10, mean = 10, sd=1), Price=rnorm(10, mean = 2,sd=1))
write.csv(TAXI, file="Travel.taxi.csv", row.names=F)

##Hotel
rst = NULL
for(c in city){
  num.hotels = sample(c(5:10),1)
  hotels = paste(c, num.hotels)
  price = rnorm(num.hotels, mean = 100, sd = 10)
  tmp = data.frame(rep(c, num.hotels), hotels, price)
  rst = rbind(rst,tmp)
}
write.csv(rst, file = "hotels.csv")
