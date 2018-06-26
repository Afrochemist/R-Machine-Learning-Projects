#Neccessary Libraries
library(arules)

#getting the data
data(Adult)

inspect(Adult[0:5])

rules <- apriori(Adult, parameter = list(support=0.5,
                                         confidence = 0.8,
                                         target = "rules"))

#there are 84 rules and 48842 transactions
summary(rules)

#Looking at the top 3 rules
#We have a 96% confidence that full-time employees do not experience any capital loss
as(head(sort(rules,by=c("confidence","support")), n=3),"data.frame")