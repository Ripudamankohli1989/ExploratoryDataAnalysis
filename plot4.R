household_data<- read.table(file='household_power_consumption.txt',sep=';',header = TRUE)# Loading the data 
View(household_data)# checking data loaded into the system

########Subsetting the data according to the dates required###############

SubsetData<-household_data[household_data$Date %in% c("1/2/2007","2/2/2007"),  ]
View(SubsetData)

########converting so that data can be plotted##########
SubsetData$Sub_metering_1<- as.numeric(SubsetData$Sub_metering_1)
SubsetData$Sub_metering_2<- as.numeric(SubsetData$Sub_metering_2)
SubsetData$Sub_metering_3<- as.numeric(SubsetData$Sub_metering_3)
SubsetData$Global_active_power<-as.numeric(SubsetData$Global_active_power)
SubsetData$Global_reactive_power<-as.numeric(SubsetData$Global_reactive_power)
SubsetData$Voltage<-as.numeric(SubsetData$Voltage)

datetime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png(filename = 'plot4.png',width = 480,height = 480)
par(mfrow=c(2,2))
#########Plot One##############
plot(datetime,SubsetData$Global_active_power,type='l',xlab='',ylab='Global Active Power')
###############Plot Two##############
plot(datetime,SubsetData$Voltage,type='l',xlab='datetime',ylab='Voltage')
###########Plot Three#################
plot(datetime,SubsetData$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
points(datetime,SubsetData$Sub_metering_2,col='red',type='l')
points(datetime,SubsetData$Sub_metering_3,col='blue',type='l')
legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,col=c('black','red','blue'),bty='n')
###########Plot Four####################
plot(datetime,SubsetData$Global_reactive_power,type='l',xlab='datetime',ylab='Global Reactive Power')
dev.off()