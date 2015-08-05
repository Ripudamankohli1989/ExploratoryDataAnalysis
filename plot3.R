household_data<- read.table(file='household_power_consumption.txt',sep=';',header = TRUE)# Loading the data 
View(household_data)# checking data loaded into the system

########Subsetting the data according to the dates required###############

SubsetData<-household_data[household_data$Date %in% c("1/2/2007","2/2/2007"),  ]
View(SubsetData)

########converting so that data can be plotted##########
SubsetData$Sub_metering_1<- as.numeric(SubsetData$Sub_metering_1)
SubsetData$Sub_metering_2<- as.numeric(SubsetData$Sub_metering_2)
SubsetData$Sub_metering_3<- as.numeric(SubsetData$Sub_metering_3)

datetime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


png (filename='plot3.png',width=480,height=480)
plot(datetime,SubsetData$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
points(datetime,SubsetData$Sub_metering_2,col='red',type='l')
points(datetime,SubsetData$Sub_metering_3,col='blue',type='l')
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'))
dev.off()

