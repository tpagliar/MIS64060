#Tim Pagliari (tpagliar@kent.edu) submission for Assignment 1 in MIS-64060-002-202080.
#The CScoreCard dataset is the Most Recent Institution Level Data from the Department of Education's College Scorecard. Retrieved from: https://collegescorecard.ed.gov/data/; I've removed some of the later columns as the original file is greater than 100MB and I didn't try to push it until i had completed the assignment.
CScoreCard <- read.csv("~/GIT/64060-tpagliar/CScoreCard.csv")
#The MaxDegree variable is categorical and references the highest degree level awarded by the institution.
# first, I'll count the number of rows (or number of institutions present)
var_MaxDegree <- CScoreCard$HIGHDEG
#Find those that award Baccalaureate Degrees or Higher
count_BSplus <- sum(var_MaxDegree>=3)
#Find those that award Master's Degrees or Higher
count_MSplus <- sum(var_MaxDegree>=4)

show(count_Rows) #The number of schools that exist in the dataset.
show(count_BSplus) #The number of schools that award Bachelor's degrees or higher.
show(count_MSplus) #The number of schools that award Masters degrees or higher.
#
#The SAT_AVG variable is qualitative, and is the average SAT score of students at the institution.
#We will create a variable with the SAT_AVG column, then remove the entries for those schools who did not require SAT scores.
sat<-as.numeric(CScoreCard$SAT_AVG, na.rm=TRUE)
var_maxsat <- max(sat,na.rm=TRUE) #is the maximum SAT average among schools who reported.
CScoreCard[which.max(sat),4] #This score belongs to:
sqrt_sat <- sqrt(sat) #An example transformation of the SAT scores into the square root of the SAT scores
#
act_matmid<-as.numeric(CScoreCard$ACTMTMID,na.rm=TRUE)
plot(act_matmid,sat)#Here is a plot of the SAT scores (y axis) vs the midpoint ACT Math score (x axis)
hist(as.numeric(CScoreCard$ADM_RATE))#and here is a histogram of the admit rate frequencies. There seem to be fewer selective institutions in this list.
sqrt_sat <- sqrt(sat) #An example transformation of the SAT scores into the square root of the SAT scores

#I hope that this satisfies the requirements of Assignment 1, I'm looking forward to learning more!

