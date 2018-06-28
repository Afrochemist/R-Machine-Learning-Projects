#Necessary Libraries
library(arules)
library(arulesViz)

#Uploading the dataset
data("Groceries")

#Looking at the dataset
str(Groceries)
head(Groceries)

inspect(Groceries[1:3])

itemFrequencyPlot(Groceries, topN = 10, type = 'absolute')

#Creating the Apriori Algorithm
metrics <- list(supp = 0.001, conf = 0.5)

rules <- apriori(Groceries, parameter = metrics)

#looking at the first 5 rules
inspect(rules[1:5])

#people whom buy honey, tidbits, coacoa drink, pudding powder, and cooking choclate usually but whole milk
#sorting the rules by decreasing confidence
rules <- sort(rules, by='confidence', decreasing = TRUE)

inspect(rules[1:5])

#Visualize the first 5 rules
plot(rules[1:5], method='graph')


