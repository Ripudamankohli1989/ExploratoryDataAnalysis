household_data<- read.table(file='household_power_consumption.txt',sep=';',header = TRUE,stringsAsFactors = FALSE)# Loading the data 
View(household_data)# checking data loaded into the system

########Subsetting the data according to the dates required###############

SubsetData<-household_data[household_data$Date %in% c("1/2/2007","2/2/2007"),  ]
View(SubsetData)

########Converting the column to numeric data type so that it could be plotted in R##########

SubsetData$Global_active_power<-as.numeric(SubsetData$Global_active_power)
View(SubsetData)

####Plotting the graph in png format########
png (filename='plot1.png',width=480,height=480)
hist(SubsetData$Global_active_power,col='red',xlab="Global Active Power(kilowatts)",main='Global Active Power')
dev.off()