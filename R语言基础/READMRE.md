#### R语言基础（R的数据结构，在R中进行数据操作，R语言中的注释用#号表示）

##### 一、环境搭建

- R语言编译器
- R集成开发环境

##### 二、数据结构

对象的5种基本类型

1. 字符

在RStudio中输入`str <- "why"`即可。

2. 数值

在RStudio中输入`x <- 5`，就表示为变量x赋值为5，通过输入`x`，可以查看x的值，其中输出的[1]表示x中的第一个元素，通过输入`class(x)`可以查看x的数据类型，输出x为numeric，其可以是小数和数字，在数字后面加入L，该数字的类型就变为整形的了，赋值符号尽量使用`<-`来表示，R语言对大小写敏感，需要注意。

3. 整数（参照数值）
4. 复数

在RStudio中输入`x <- 3+4i`，即可。

5. 逻辑

在RStudio中输入`b <- True`即可，需要注意的是其的每个字母需要大写。

6. 对象属性

- 名称
- 维度
- 类型
- 长度

7. 向量：只能包含同一类型的对象

- 第一种方法：使用vector函数创建一个向量，输入`x <- vecror('character',length = 10)`，类似于创建一个字符串数组。
- 第二种方法：输入`x1 <- 1:4`，就可以生成一个元素分别为1，2，3，4的一个整形数组了，输入`names(x1) <- c('a','b','c','d')`，表示为该数组中的每个元素添加一个名字（类似于python字典中的键/）
- 第三种：输入`x2 <- c(1,2,3)`,就可以生成一个元素分别为1，2，3的一个数字数组了，注意当c输入的元素为不同的类型时，R会自动做类型的转换。
- 类型强制转换函数：（注意需要传入相关的参数）

  ```R
  as.logical()
  as.numeric()
  as.character()
  ```

8. 矩阵：向量+维度属性（整数向量：nrow，ncol）

- 创建矩阵的第一种方法：`x <- matrix(nrow = 3,ncol = 3)`，表示创建一个3*3的矩阵，`x <- matrix(nrow = 3,ncol = 3)`为该矩阵添加内容，默认从列开始填充的，`dim(x)`表示查看矩阵的维度，`attributes(x)`表示查看矩阵x的属性有哪些。
- 创建矩阵的第二种方法：先创建一个向量，然后为该向量添加一个维度属性即可，如`y <- 1:4 dim(y) <- c(2,2)`即可。
- 矩阵的拼接
  - 按行拼接：

  ```R
  y <- 1:6
  dim(y) <- c(2,3)

  y1 <- 7:12
  dim(y1) <- c(2,3)
  rbind(y,y1)
  列数不变，行数相加
  ```

  - 按列拼接：

  ```R
  y <- 1:6
  dim(y) <- c(2,3)

  y1 <- 7:12
  dim(y1) <- c(2,3)
  cbind(y,y1)
  行数不变，列数相加
  ```

9. 数组：与矩阵类似，但是维度可以大于2

- 数组创建
  - 输入`x <- array(1:24, dim = c(4,6))`，表示创建一个4*6的矩阵。
  - 输入`x <- array(1:24, dim = c(2,3,4))`,表示创建一个三维的数组，表示有4个2*3的矩阵。

10. 列表（list）:可以包含不同类型的对象

- 输入`x <- list('1',3,10L,TRUE,4+4i)`表示创建元素分别为'1',3,10L,TRUE,4+4i的列表。

- 输入`x <- list(a='1',b=3,c=10L,d=TRUE,e=4+4i)`表示分别为元素添加名称a,b,c,d.

- 输入`x <- list(1:3,c(3,4))`表示表示第一个元素为1,2,3，第二个元素为3,4。

- 为矩阵的每一个元素添加一个名称：

```R
x <- matrix(data = 1:9, nrow = 3,ncol = 3)
dimnames(x) <- list(c('a','b','c'),c(1,2,3))
```
11. 因子（factor）:处理分类数据的（分类数据又分为有序数据和无序数据），可以理解为整数向量+标签（label）优于整形向量

- 输入`x <- factor('f','m','f'))`表示分为f和m两类。
- 输入`x <- factor('f','m','f'),levels = c('m','f'))`表示设置m类在前面。
- 输入`table(x)`来查看因子的相关信息。
- 输入`unclass(x)`表示去掉因子的属性后再输出。
- 输入`class(unclass(x))`表示将因子转换成整形。

12. 缺失值（missing value）:分为NA和NaN，NaN属于NA，但是NA不属于NaN，NaN一般用于表示数字的缺失值，NA的表示范围更广。其在数据的预处理中比较重要。

- 输入以下命令：


```
x <- c(1,NA,2,3)
is.na(x)
判断向量x中的每一个元素是不是缺失值，是就返回真，否则返回假，
```

13. 数据框：用来存储表格数据，视为各元素长度相同的列表（每个元素代表一列数据，每个元素的长度代表行数，元素类型不同）

- 数据框的创建：输入`df <- data.frame(id = c(1,2,3,4),name = c('lisi','wangwu','zhangsan','lll'),gander = c(TRUE,FALSE,TRUE,TRUE))`就表示创建一个数据框了，其类似于矩阵的写法，输入`nrow(df) ncol(df)`用于查看数据框的行数和列数，输入`data.matrix(df)`可以将数据框转换成矩阵。


14. 日期与时间（date与time）

- 输入`x <- date()`即可输出系统当前的时间，该种方法输入的类型为字符串，`x1 <- Sys.Date()`表示输出系统当前的日期，其为日期类型的。输入`x1 <- Sys.Date()`表示将字符串转换成日期类型。
- 查看日期的详细信息

```
weekdays(x3)
months(x3)
quarters(x3)
julian(x3)
```

- 日期的运算：返回两个日期相差的天数


- 时间：POSIXct/POSIXIt

- POSIXct其为整数，常用于存入数据框

- POSIXIt其为列表，还包含星期、年、月、日等信息

  - 输入`x1 <- Sys.time()`表示获取系统当前的时间，其的类型为"POSIXct" 和"POSIXt"，要转换成这两种类型可以通过`p <- as.POSIXlt(x1)`来实现，`unclass(p)`表示把p的属性去掉，只留下内容，`names(unclass(p))`表示输出内容的名称，其中`p$sec`表示获取p下的sec的具体内容，`p2 <- as.POSIXct(p)`表示把lt的内容转化为xt的。
  - 将一个字符串转换成时间类型的：

  ```R
  x2 <- "Jan 1,2016 12:31"
  strptime(x2,"%B %d,%Y %H:%M")
  ```

##### 三、数据操作

- 构建子集（从原始数据中得到自己想要的数据，从原始数据得到预处理后的数据r）
- 构建子集的基本方法：
- []：提取一个或者多个类型相同的元素
- 比如`x <- 1:10 x[6]`表示取出向量x中的第6个元素，`x[1:4]`表示取出向量x中的第一个到第四个元素，类似于python中的切片操作，`x[x>4]`表示输出向量中大于4的所有元素，`x[x>5 & x<8]`表示取出大于5并且小于8的元素。
- 输入如下的代码：

```
x <- 1:4
names(x) <- c('a','b','c','d')
x['b']
表示取出x的第二个元素，类似于python中的字典的操作，
```



- [[]]：从列表或数据框中提取元素
- $：按名字从列表或数据框中提取元素
- 矩阵的子集：
- 输入如下的代码：

```
x <- matrix(1:6,2,3) 表示生成一个2*3的矩阵
x[1,2] 表示取出第一行第二列的元素
x[1,] 表示取出第一行的内容
x[,1] 表示取出第一列的内容
x[2,c(1,3)] 表示取出第二行第一列和第三列的内容
x[1,2,drop = FALSE] 返回x的子矩阵
```

- 数据框的子集
- 输入如下的代码：

```R
df <- data.frame(id = c(1,2,3,4),name = c('lisi','wangwu','zhangsan','lll'),gander = c(TRUE,FALSE,TRUE,TRUE)) 创建一个数据框
df$id[c(2,4)] <- NA 表示把df的第一列的数据中的第二行和第四行设置为NA
df[,2] 表示取出第二列的数据，不包含键值，等同于df[,'name']
df[(df$id<3 & df$gander==TRUE),] 表示取出df中的id小于3并且性别为TRUE的所有行的数据
which()的作用是返回向量中哪些结果为真的数据的下标
subset(df,df$id>3) 表示取出df中的id大于3的一个子集
```

- 列表的子集（创建的方法：[[]]、$、`[[]][]`、`[[]][[]]`、嵌套列表、不完全匹配）

```
x <- list(a=1:4,b=3,c=10L,d=TRUE,e=4+4i) 创建一个列表
x[1]表示得到列表的第一个元素为1，等同于x['a']
x[[1]] 表示取出列表第一个元素的内容，不包含那个键值，等同于x[['a']]
x$a 表示取出列表中名字为a的元素的所有值
x[c(1,3)] 表示取出列表中的第一个和第三个元素的所有内容
f <- 'a' x[f] 通过这种方法来取值是可行的，而x$y是不可行的
```

- 从列表中获取嵌套的元素

```
x <- list(a = list(1,2,3,4), b = c(5,6,7)) 创建一个元素为列表的元素
x[[1]] 取出第一个元素的所有内容
x[[1]][[2]] 表示取出第一个元素中的第一个元素的值
x[[c(1,3)]] 表示取出第一个元素中的第三个元素的值
```

- 不完全匹配

```
x <- list(asdsd = 1:10) 创建一个列表
x$asdsd的效果等同于x$a，而输入x[['a']]则不行
x[['a',exact = FALSE]] 表示不完全匹配 ok，而当列表中有同名的名字的时候，这个时候不完全匹配就不可取了。
```

- 处理缺失值

```
x <- c(1,NA,3,NA) 创建一个包含缺失值的向量
x[!is.na(x)] 表示获取原始数据x中不为缺失值的数据
x1 <- c(2,2,NA,4)
z <- complete.cases(x,x1) 表示选取对应元素都不为缺失值的数据的真与假，此时x[z]和x1[z]即为需要的值
library(datasets) 表示导入一个名为datasets的包，相当于python中的import os
head(airquality) 表示查看airquality这个数据源的前6行的数据
g <- complete.cases(airquality) 表示把airquality中的不为缺失值的数据的真与假保存到g中
airquality[g,][1:10,] 表示取出airquality中不为缺失值的所有数据中的前十行
```

- 向量化操作（可以作用于向量、矩阵等结构，使得代码简介、易于阅读、效率高）

```
x <- 1:6
y <- 7:11 表示创建两个向量
x + y 表示两个向量对应的元素相加，并返回该向量，前提是这两个向量对应的元素个数必须相同
rep(2,4) 表示把2重复4次，若x和y为两个矩阵，则x %*% y表示矩阵x和矩阵y真正的乘法
```

- 重要函数的使用
- 处理循环（R不仅有for/while循环语句，还有更强大的实现循环的一句话函数）
- lapply：可以循环处理列表中的每一个元素
- lapply(参数)：lapply(列表，函数名，其他参数)
- 其总是返回一个函数


```
str() 该函数的作用是把任意的R对象以一种紧凑的形式显示出来
str(lapply) 表示以简介的形式来显示函数lapply函数的用法
 x <- list(a = 1:3,b= c(3,4)) 表示创建一个列表，列表的第一个名为a的元素的内容为1，2，3，第二个名为b的元素的内容为3，4
 lapply(x,mean) 表示求出对应元素的内容的平均值
 lapply(x,runif) 从均匀分布的总体中抽出若干个 从0-1进行抽取
 lapply(x,runif,min =0,max=100) 从0-100中抽取
 x <- list(a=matrix(1:6,2,3), b = matrix(4:7,2,2)) 表示创建一个每个元素都为矩阵的列表
 lapply(x,function(m) m[1,]) 表示取出列表中的每个元素的第一行的数据，m表示传入的参数为一个矩阵
 sapply()函数的用法类似于lapply，其还能对结果进行化解，能化解就化解，不能化解就不化解，跟lapply一样，sapply(x,mean)表示把结果简化成一个列表了
```

- sapply：简化一个列表（当结果列表元素长度均为1，返回向量，当结果列表元素长度相同且大于1，返回矩阵）
- apply函数：（沿着数组的某一维度处理数据，例如，将函数用于矩阵的行或者列，虽然与for/while循环的效率相似，但是只用一句话就能搞定了）
- apply(参数)：apply(数组，维度，函数/函数名)

```
x <- matrix(1:16,4,4) 表示创建一个矩阵
apply(x,2,mean) 表示求每一列的平均
apply(x,2,sum) 表示求每一行的平均
rowSums(x) 表示求每一行的和
rowMeans(x) 表示求每一行的平均值
colMeans(x) 表示求每一列的平均值
colSums(x) 表示求每一列的和
x <- matrix(rnorm(100),10,10) 表示从服从正态分布的数据中抽取100个数据构成一个10*10的矩阵
apply(x,1,quantile,probs = c(0.25,0.75)) 表示取出25%和75%的分位点
x <- array(rnorm(2*3*4),c(2,3,4)) 表示生成一个3维的数组，第三个维度为4.然后每个维度的元素为一个2*3的矩阵
apply(x,c(1,2),mean) 表示求第一维和第二维的平均值
```

- mapply(参数)：mapply(函数名/函数，数据，函数相关的参数)，lapply的多元版本

```
x <- list(rep(1,4),rep(3,2),rep(4,1)) 表示创建一个具有3个元素的列表，其中rep(1,4)表示4个1
mapply(rep,1:4,4:1) 表示1:4中对应元素重复的次数，比如1重复4次，2重复3次，3重复2次，4重复一次。
s <- function(n,mean,std){
  rnorm(n,mean,std)
}
该函数的作用是从均值为mean,标准差为std的正太分布中抽取n个数据
mapply(s,1:5,5:1,2) 表示从1:5中抽取提取对应的数据
```

- tapply(参数)：tapply(向量，因子/因子列表，函数/函数名)，其是对向量的子集进行操作，

```
x <- c(rnorm(5),runif(5),rnorm(5,1)) 创建一个3个元素的向量，第一个元素为从服从正太分布的数据中随机取出5个，第二个元素为服从均匀分布的5个数据，第三个元素为均值为5，方差为1的数据中取出5个
f <- gl(3,5) 表示分为3个水平，每个水平下有5个元素
tapply(x,f,mean) 表示x按照f来分组，并求出对应组的平均值
tapply(x,f,mean,simplify = FALSE) 表示把向量转化为列表
```

- split(参数)：split(向量/列表/数据框/因子/因子列表)，根据因子或者因子列表列表将向量或其他对象分组，通常与lapply一起使用

```
x <- c(rnorm(5),runif(5),rnorm(5,1)) 创建一个3个元素的向量，第一个元素为从服从正太分布的数据中随机取出5个，第二个元素为服从均匀分布的5个数据，第三个元素为均值为5，方差为1的数据中取出5个
f <- gl(3,5) 表示分为3个水平，每个水平下有5个元素
split(x,f) 返回列表，x根据f分为3个组
lapply(split(x,f),mean) 表示求取分组后的5个数据的平均值
split(airquality,airquality$Month) 表示按月份查看数据
table(airquality$Month) 查看其有多少个月份，并且相应的月份下有多少个数据
lapply(s,function(x) colMeans(x[,c('Ozone','Wind')])) 表示输出相应两列的值，其不存在缺失值
sapply(s,function(x) colMeans(x[,c('Ozone','Wind')])) 类似于lapply，其结果中存在缺失值
lapply(s,function(x) colMeans(x[,c('Ozone','Wind')],na.rm=TRUE)) 表示去掉缺失值
```

- 排序
- sort:对向量进行排序；返回排好序的内容
- order:返回排好序的内容的下标/多个排序

```
df <- data.frame(id = c(1,2,3,4),name = c('lisi','wangwu','zhangsan','lll'),gander = c(TRUE,FALSE,TRUE,TRUE))
sort(df$name) 表示对name这一列进行排序操作
sort(df$name,decreasing = TRUE) 表示对name这一列进行排序操作（降序）
order(df$name) 表示名字对应的行号
df[order(df$name),] 表示按name对数据框进行排序
df[order(df$name,df$id),] 表示按照name和id来排序
df[order(df$name,df$id,decreasing = TRUE),] 表示按照name和id来排序（降序）
```

- 总结数据信息

```
head(airquality) 表示前6行的数据
tail(airquality) 表示后6行的数据
head(airquality,1) 表示查看前一行的数据
summary(airquality) 表示返回该数据集的分布情况
str(airquality) 对该数据进行简单的总结
table(airquality$Ozone,useNA = 'ifany') 表示对有缺失值的也总结出来
table(airquality$Ozone,airquality$Solar.R) 表示对两列的数据进行总结
any(is.na(airquality$Ozone)) 其返回true表示该数据中一定有缺失值
sum(is.na(airquality$Ozone)) 表示该数据中有多少个缺失值
all(airquality$Ozone<12) 判断是不是所有的数据都小于2
aa <- as.data.frame(Titanic) 将泰坦尼克的数据存入aa中
dd <- xtabs(Freq ~Class + Age,data = aa) 表示查看交叉表的内容
ftable(dd) 表示将其数据扁平化
object.size(airquality) 表示输出该数据集有多大
print(object.size(airquality),units = 'Kb') 表示以Kb的形式输出该变量
```



- 排序
- 总结数据信息
- ​


