#Necessary libraries
library(ISLR)
library(ggplot2)
library(cluster)


#checking out what the data looks like
head(iris)

pl <- ggplot(iris, aes(Petal.Length, Petal.Width,color=Species))
print(pl + geom_point(size = 4))


#planting the seeds
set.seed(101)

#Checking out the cluster
iris.Cluster <- kmeans(iris[,1:4], 3, nstart = 20)

iris.Cluster

#Looking at the clusters at a quantitative level
#the row with the highest number identifies that particular cluster
table(iris.Cluster$cluster,iris$Species)



#Creating a cluster plot
#Clusplots shows the variability of each cluster
clus <- clusplot(iris, iris.Cluster$cluster, color = T, shade = T, labels = 0,
         lines = 0)

clus