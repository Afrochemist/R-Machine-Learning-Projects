#Neccessary Libraries
library(FactoMineR)
library(factoextra)
library(magrittr)
library(dplyr)
library(tidyr)
library(tibble)
data(decathlon2)

#getting to know the data
str(decathlon2)
dim(decathlon2) #27 rows and 13 columns
summary(decathlon2)


####
#Processing section
####


#Order by rank
decathlon2 %>% rownames_to_column %>% arrange(Rank)

decathlon2_features <- decathlon2[,1:10]

####
#PCA Section
####
#PCA reduces the number of features in a dataset

pca_decathlon <- PCA(decathlon2_features, graph = FALSE, scale.unit = TRUE, ncp = 4)

pca_decathlon

#Creating the screeplot
#Screeplots are visuals that show how many features to retain
fviz_eig(pca_decathlon, addlabels = TRUE, ylim = c(0,4), choice = 'eigenvalue')



pca_decathlon$var


#Will explain later
fviz_cos2(pca_decathlon, choice = 'var', axes = 1:2)


#Correlation Circle
#This plot shows the correlation between features
fviz_pca_var(pca_decathlon, repel = TRUE)

#Adding color to the plot
fviz_pca_var(pca_decathlon, col.var = 'cos2', gradient.cols = c('orange', 'red', 'blue'), repel = TRUE)


fviz_pca_ind(pca_decathlon, col.ind = 'cos2', pointsize = 'contrib', gradient.cols = c('orange', 'red', 'blue'), 
             repel = TRUE)


#Biplot
#Biplots are graphs that show correlation between features
fviz_pca_biplot(pca_decathlon, repel = TRUE, col.var = 'black', col.ind = 'cos2', gradient.cols = c('orange', 'red', 'blue'))