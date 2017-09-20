# Vector
x <- vector('character', length = 10)
x1 <- 1:4
x2 <- c(1,2,3,4)
x3 <- c(TRUE,10,'dd')
as.logical(x3)
as.numeric(x3)
as.character(x3)
names(x1) <- c('a','b','c','d')

#Matrix and Array
x <- matrix(nrow = 3,ncol = 3)
x <- matrix(data = 1:9, nrow = 3,ncol = 3)
dim(x)
attributes(x)

y <- 1:6
dim(y) <- c(2,3)

y1 <- 7:12
dim(y1) <- c(2,3)
rbind(y,y1)

y <- 1:6
dim(y) <- c(2,3)

y1 <- 7:12
dim(y1) <- c(2,3)
cbind(y,y1)

x <- array(1:24, dim = c(4,6))
x <- array(1:24, dim = c(2,3,4))

# list
x <- list('1',3,10L,TRUE,4+4i)

x <- list(a='1',b=3,c=10L,d=TRUE,e=4+4i)

x <- list(1:3,c(3,4))

x <- matrix(data = 1:9, nrow = 3,ncol = 3)
dimnames(x) <- list(c('a','b','c'),c(1,2,3))

# Òò×Ó£¨factor£©
x <- factor(c('f','m','f'))

x <- factor(c('f','m','f'),levels = c('f','m'))
table(x)

unclass(x)

class(unclass(x))

# Missing value
x <- c(1,NA,2,3)
is.na(x)

# data fram
df <- data.frame(id = c(1,2,3,4),name = c('lisi','wangwu','zhangsan','lll'),gander = c(TRUE,FALSE,TRUE,TRUE))
nrow(df)
ncol(df)

data.matrix(df)

# date and time
x <- date()
x1 <- Sys.Date()

x3 <- as.Date('2018-09-12')
weekdays(x3)
months(x3)
quarters(x3)
julian(x3)

x1 <- Sys.time()
p <- as.POSIXlt(x1)
names(unclass(p))
p2 <- as.POSIXct(p)

x2 <- "Jan 1,2016 12:31"
strptime(x2,"%B %d,%Y %H:%M")

x <- 1:4
names(x) <- c('a','b','c','d')
x['b']

x <- matrix(1:6,2,3)

df <- data.frame(id = c(1,2,3,4),name = c('lisi','wangwu','zhangsan','lll'),gander = c(TRUE,FALSE,TRUE,TRUE))

x <- list(a=matrix(1:6,2,3), b = matrix(4:7,2,2))




