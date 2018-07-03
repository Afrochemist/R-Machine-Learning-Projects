#This file has multiple sections
#Necessary Libraries
library(caret)
library(randomForest)
library(ROCR)


#Uploading the dataset
credit.df <- read.csv("credit_dataset_final.csv", header=TRUE, sep=',')

####
#Data processing
####

#Converting the column data type to factors
to.factors <- function(df, variables){
  for (variable in variable) {
    df[[variable]] <- as.factor(df[[variable]])
  }
  return(df)
}

#scaling
scale.features <- function(df, variables) {
  for (variable in variables) {
    df[[variable]] <- scale(df[[variable]], center = T, scale = T)
  }
  return(df)
}

numeric.vars <- c("credit.duration.months","age","credit.amount")

credit.df <- scale.features(credit.df, numeric.vars)

#factor variables
categorical.vars <- c('credit.rating', 'account.balance',
                      'previous.credit.payment.status',
                      'credit.purpose', 'savings',
                      'employment.duration', 'installment.rate',
                      'marital.status', 'guarantor',
                      'residence.duration', 'current.assets',
                      'other.credits', 'apartment.type',
                      'bank.credits', 'occupation',
                      'dependents', 'telephone', 'foreign.worker')

credit.df<- to.factors(df=credit.df,variables = categorical.vars)
#there is an error
#need to fix

#Setting up the training and testing data
indexes <- sample(1:nrow(credit.df), size = 0.6*nrow(credit.df))

train.data <- credit.df[indexes, ]

test.data <- credit.df[-indexes, ]


####
#Feature Selection
####

run.feature.selection <- function(num.iters=20, feature.vars, class.var){
  set.seed(10)
  variable.sizes <- 1:10
  control <- rfeControl(functions = rfFuncs, method = "cv",
                        verbose = FALSE, returnResamp = "all",
                        number = num.iters)
  results.rfe <- rfe(x = feature.vars, y = class.var,
                     sizes = variable.sizes,
                     rfeControl = control)
  return(results.rfe)
}

rfe.results <- run.feature.selection(feature.vars=train.data[,-1],
                                     class.var=train.data[,1])
#there is an error
#need to fix
rfe.results

varImp(rfe.results)


