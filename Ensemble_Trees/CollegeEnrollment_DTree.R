#Neccessary Libraries
library(ISLR)
library(caTools)
library(rpart)
library(rpart.plot)
#Uploading the dataset
df <- College

#Getting to know the data
str(df)
summary(df)

#looking at the first few rows in the dataset
head(df)

#Train/Test split
set.seed(101)
sample <- sample.split(df$Private, SplitRatio = 0.70)
train <- subset(df, sample == T)
test <- subset(df, sample == F)

#Creating the decision tree
tree <- rpart(Private ~ ., data = train, method ='class')

#Getting to now the tree
summary(tree)

#Getting the predtictions
tree_predictions <- predict(tree,test)

#Converting the data to a dataframe
tree_predictions <- as.data.frame(tree_predictions)

#Separating the Yes and No with a function
joiner <- function(x){
  if (x >= 0.5){
    return('Yes')
  }else{
    return('No')
  }
}

#Attaching the predictions with the criteria
tree_predictions <- sapply(tree_predictions$Yes,joiner)

#Looking at the first feww colleges
head(tree_predictions)

#Confusion matrix from the training and testing data
confusionMatrix(tree_predictions$Private, test$Private)

#plotting the tree
prp(tree)