#包齿数据分析脚本
#版本：V1.0
#作者：运行技术中心
#时间：2015-7-11

#清空数据空间
rm(list = ls())
#设定数据路径
setwd("E:/专题分析/包齿问题/data/赤峰包齿齿轮箱M02 06 08 18 28/m06/采集SCADA运行数据：(1)采集点")
filelist <- list.files(pattern = ".*.csv")

#数据检查

#csv格式批量读入数据

datalist <- lapply(filelist,function(x) read.table(x,header = T,sep=","))    #数据列表

datafr <- do.call("rbind", datalist)     #转换为数据框，或者as.data.frame(datalist)

####################################################################################
#sas数据读入
####################################################################################
#install.packages("sas7bdat")
#library(sas7bdat)
#sasdata <- read.sas7bdat(file = "")

datafr <- unique(datafr)
datafr <- datafr[datafr$converter_power>=500,]
datafr <- datafr[complete.cases(datafr),]
datafr <- datafr[order(datafr$Time),]
write.table(x = datafr,file = "马架子M06数据.csv",sep = ",",row.names = F)
rm(datalist)
plot(datafr$gearbox_lubrication_filter_outlet_pressure,main = "马架子M06油压",pch=1)











#数据导入
#带分隔符的文本文件中导入数据
#read.table(file,header=logical_value,sep="delimiter",row.names="name")
#file:是一个带ASCII文本文件；header:是一个表明首行是否包含了变量名逻辑值；sep:制定分隔数据的分隔符；row.names:是一个可选参数，用来制定一个或多个表示行标识的变量
#winddata <- read.table("D:/xuehaoning/111/data1.csv",header = TRUE,sep = ",")


#attach(winddata)
#直方图绘图
#hist(wind_speed,breaks = 60)
#散点图plot()
#plot(wind_speed,grid_power)
#散点图smoothScatter(),根据核密度估计生成用颜色密度来表示点分布的散点图
#smoothScatter(wind_speed,grid_power,colramp = colorRampPalette(c("white","gray1")))

#detach(winddata)