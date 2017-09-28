x <- c(1,2,3,4,5,6,7,8,9)
mean(x)
median(x)
var(x)
sd(x)
summary(x)
hist(airquality$Wind, xlab = '风速')
boxplot(airquality$Wind, xlab = '风速',ylab = '速度')
boxplot(Wind~Month,airquality,xlab = '风速',ylab = '速度')

plot(airquality$Wind,airquality$Temp)
with(airquality,plot(Wind,Temp,title(main='wind and temp'),type = 'n'))
with(subset(airquality,Month == 9),points(Wind,Temp,col='red'))
with(subset(airquality,Month == 5),points(Wind,Temp,col='green'))
with(subset(airquality,Month %in% c(6,7,8)),points(Wind,Temp,col='black'))
fit <- lm(Temp ~ Wind,airquality)
abline(fit,lwd = 2)

legend('topright',pch = 1,col = c('red','green','black'),legend = c('sep','may','other'))

par('bg')
par('col')
par('mar')
par('mfrow')
par('mfcol')
par(mfrow = c(1,2))

hist(airquality$Wind)
hist(airquality$Temp)

xyplot(Temp ~ Wind, data = airquality)
airquality$Month <- factor(airquality$Month)

xyplot(Temp ~ Wind | Month, data = airquality,layout = c(5,1))


q <- xyplot(Temp ~ Wind, data = airquality)

print(q)

set.seed(1)
x <- rnorm(100)
f <- rep(0:1,each=50)

y <- x + f - f*x + rnorm(100,sd = 0.5)

f <- factor(f,labels = c('group1','group2'))

xyplot(y ~ x | f, layout = c(2,1))

xyplot(y ~ x | f, panel = function(x,y){
  panel.xyplot(x,y)
  panel.abline(v = mean(x),h = mean(y),lty = 2)
  panel.lmline(x,y,col = 'red')
})










