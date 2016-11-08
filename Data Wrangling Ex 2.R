
#load packages

library(dplyr)
library(tidyr)

#read data into R & view it
titanic_original <- read.table("titanic_original.csv", header=TRUE, sep=",")
str(titanic_original)
View(titanic_original)
tbl_df(titanic_original)
glimpse(titanic_original)



titanic_working <- titanic_original

#part1 Port of embarkation
#finind missing values (could be blank or empty string) and replce them with S.
#embarked_missing

titanic_working$embarked[titanic_working$embarked == ""] <- "S"

#check they were coded as S
embarked_missing <- filter(titanic_working, embarked =="") 
View(titanic_working)


#part2 Age
#Replace missing age values with mean age

#calculate the mean of age and replace missing age values with it
#look at mean
mean(titanic_original$age, na.rm=TRUE)

#replace mean
titanic_working$age[is.na(titanic_working$age)] <- mean(titanic_working$age, na.rm = TRUE)
View(titanic_working)

#other ways I could have popluated the missing values int eh age column. Why would you pick any of those over the mean or not.
#calculating a mean of adults vs children and replacing that way might be more accurate.

#part3 Lifeboat
#fill missing balues in the boat column with a dummy value (i.e. string 'None')
titanic_working$boat[titanic_working$boat == ""] <- NA
View(titanic_working)

#part4 Cabin
#no cabin number may indicate that they were not a passenger and may not have had a cabin so it doesn't make sense to add a missing value here.
#create new column has_cabin_number (1) and doesn't (0)


titanic_working$has_cabin_number<-ifelse(titanic_working$cabin !="",1,0)
View(titanic_working)


#save my new dataset 
write.csv(tintanic_working, file = “titanic_clean.csv")


##save original dataset
write.csv(tintanic_original, file = “titanic_original.csv")





