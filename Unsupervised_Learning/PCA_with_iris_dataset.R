#Necessary Libraries
library(devtools)
library(FactoMineR)
library(factoextra)



#Uploading data
data(iris)

log.x <- log(iris[, 1:4])
ir.species <- iris[, 5]


#Now applying PCA to the data
ir.pca <- prcomp(log.x, center = TRUE, scale. = TRUE)


print(ir.pca)

#creates a skee plot and shows which columns to eliminate
plot(ir.pca, type='l')


#Shows std between column 
#Any column with an std of 0 will be ignored 
summary(ir.pca)



#Retrieving the eigenvalues
res.pca <- PCA(log.x, graph=FALSE)
get_eig(res.pca)


#graphing the screeplot
fviz_screeplot(res.pca, addlabels = TRUE, ylim = c(0, 90))