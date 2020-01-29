###########################################################################################
###########################################################################################
# Author: Zaid Haddad
# Purpose: Supporting other R users on social Media
# Objective: Replicate Tabluea and Python plot using R from a sepecific data set
###########################################################################################
###########################################################################################

#Load all necessary libraries
#Load the xlsx library to read the excel sheet
library(xlsx)
#load the tidyverse library for ggplot and others (one line of code for many handful libraries)
library(tidyverse)

#Read the excel sheet, and specify sheet #1 
#Reading strings as Factors is opetional; thus commented it out and my code converts to strins
data.chld.sugar <- read.xlsx("2020W3.xlsx", 1)#, stringsAsFactors = F)

#Always check your data
#Check the data; dimension and header
dim(data.chld.sugar)
head(data.chld.sugar)


#Let's clean up the column names or names of the data frame. Will make potting easier
colnames(data.chld.sugar) <- c("Age_group", "Y2008_2009", "Y2010_2011", "Y2012_2013", "Y2014_2015")


#keep only the Children groups by perfrming the filter on the Age-group.
data.chld.sugar.1 <- data.chld.sugar %>%
  filter(Age_group %in% c("Children 1.5-3 years", "Children 4-10 years", "Children 11-18 years"))
    
#Make sure Age_group is a factor and re-level to order the Children's group in the correct order
data.chld.sugar.1$Age_group <- factor(data.chld.sugar.1$Age_group, levels=c("Children 1.5-3 years", "Children 4-10 years", "Children 11-18 years"))
  

#Using ggplot, will create the Bar plot and will try to make it very close to the Python output
ggplot(data = data.chld.sugar.1, 
         mapping = aes(x = Age_group,
                       y = Y2014_2015))+
  geom_bar(stat="identity",width=.6)+ #reduce th width of the barplot to mimic the Python plot output
  scale_y_continuous(name="% of sugar intake \n", breaks=c(0,2,4,6,8,10,12,14))+#using the same breaks
  xlab("Age bracket")+
  ggtitle("Children's sugar intake as a % of total energy")
