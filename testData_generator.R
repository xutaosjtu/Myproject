N = 100

## A~J cities
set.seed(10)
link.air = matrix(rbinom(N,1, 0.3), ncol = 10)
colnames(link.air) = LETTERS[1:10]
rownames(link.air) = LETTERS[1:10]
tmp = mapply(cost, mean = 100,link.air)
ticket.air  = matrix(tmp, ncol = 10)

set.seed(234)
link.train = matrix(rbinom(N,1, 0.3), ncol = 10)
colnames(link.train) = LETTERS[1:10]
rownames(link.train) = LETTERS[1:10]
tmp = mapply(cost, mean=50,link.train)
ticket.train  = matrix(tmp, ncol = 10)

link.bus = matrix(rep(1, 100), ncol = 10)
colnames(link.bus) = LETTERS[1:10]
rownames(link.bus) = LETTERS[1:10]
tmp = mapply(cost, mean = 30,link.bus)
ticket.train  = matrix(tmp, ncol = 10)

## within city
places = matrix()

## assume the price is constant
hotel.mean = rnorm(10, mean = 50, sd =10)
hotel = sapply(hotel.mean, function(x) abs(rnorm(10, mean = x, sd = 5)))
rownames(hotel) = LETTERS[1:10]
colnames(hotel) = letters[1:10]

