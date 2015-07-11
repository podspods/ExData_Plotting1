#--------------------------------------------------------------------------------------------
# filename      : plot1.r
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
    

#----------------------------------------------------------------------------------
hist(HPC_WorkingDataset$Global_active_power.num,main ="Global active Power",
     ylim=c(0, 1200),
     col="red", 
     xlab = "Global active Power(kilowatts)")

dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() 

