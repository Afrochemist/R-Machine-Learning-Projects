#neccessary libraries
library(rpart)
library(rpart.plot)
#getting to know the data
str(kyphosis)
head(kyphosis)

#now building a tree model
tree <- rpart(Kyphosis ~ .,method='class', data=kyphosis)
printcp(tree)
plot(tree, uniform = T, main = "Kyphosis Tree")
text(tree, use.n = T, all = T)

#Now making the plot look nicer 
prp(tree)