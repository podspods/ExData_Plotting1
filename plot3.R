#--------------------------------------------------------------------------------------------
# filename      : Plot3.R
# subject       : Exploratory Data Analysis courses
# author        : Emile Destrieux
# create date   : July, 11, 2015
#--------------------------------------------------------------------------------------------


Sys.setlocale("LC_TIME", "en_US.UTF-8")
# load data
HPC_Dataset= read.csv2(file = "data/household_power_consumption.txt",
                       header = TRUE, 
                       sep = ";",
                       stringsAsFactors= FALSE)
# convert date 
HPC_Dataset$Date.dt <- as.Date(HPC_Dataset$Date,format="%d/%m/%Y")
# filter by date
HPC_WorkingDataset <- subset (HPC_Dataset, (HPC_Dataset$Date.dt  >=  "2007-02-01")&(HPC_Dataset$Date.dt  <=  "2007-02-02")  )

# convert time 
HPC_WorkingDataset$Date.date_time<-paste(HPC_WorkingDataset$Date,HPC_WorkingDataset$Time)
HPC_WorkingDataset$Date.Time.dt <- strptime(HPC_WorkingDataset$Date.date_time,"%d/%m/%Y %H:%M:%S")

# convert string to numeric
HPC_WorkingDataset$Global_active_power.num <- as.numeric(HPC_WorkingDataset$Global_active_power)


HPC_WorkingDataset$Sub_metering_1.num <- as.numeric(HPC_WorkingDataset$Sub_metering_1)
HPC_WorkingDataset$Sub_metering_2.num <- as.numeric(HPC_WorkingDataset$Sub_metering_2)
HPC_WorkingDataset$Sub_metering_3.num <- as.numeric(HPC_WorkingDataset$Sub_metering_3)

HPC_WorkingDataset$Voltage.num <- as.numeric(HPC_WorkingDataset$Voltage)
HPC_WorkingDataset$Global_reactive_power.num <- as.numeric(HPC_WorkingDataset$Global_reactive_power)



#plot 3
# empty graph 
    plot(HPC_WorkingDataset$Date.Time.dt,
         HPC_WorkingDataset$Sub_metering_1.num,
         type = "n",
         ylab = "Global active Power(kilowatts)",
         xlab="")
    
    points(HPC_WorkingDataset$Date.Time.dt,
           HPC_WorkingDataset$Sub_metering_1.num,
           type="l",col='black')
    points(HPC_WorkingDataset$Date.Time.dt,
           HPC_WorkingDataset$Sub_metering_2.num,
           type="l",col='red')
    points(HPC_WorkingDataset$Date.Time.dt,
           HPC_WorkingDataset$Sub_metering_3.num,
           type="l",col='purple')
    
    #liste au title
    title=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    #liste of color
    colors=c("black","red","purple")
    legend("topright",lty = "solid" , col =colors, legend = title,cex=0.7)

#----------------------------------------------------------------------------------
dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() 