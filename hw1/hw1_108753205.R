
args = commandArgs(trailingOnly=TRUE)

#讀檔

if (length(args)==0) {
  stop("USAGE: Rscript hw1_108753205.R input ", call.=FALSE)
} 

if(args[1] == "--input"){
  inputfile <-  args[2]
  outputfile <- args[4]
}else if (args[1] == "--output"){
  inputfile <-  args[4]
  outputfile <- args[2]
}else{
  stop("input error", call.=FALSE)
}

data = read.csv(file = inputfile)


#去掉小數
data[3]<- round(data[3],2)
data[5]<- round(data[5],2)




#選取最大值
data <- apply(data,2,max)

#轉置
result <-t(data.matrix(data)[-6,])

#從字串中取出一部分的子字串
result[1] <- substr(inputfile,start =3,stop=5)

colnames(result)[colnames(result)=="persons"] <- "set" 

write.table(result, file = outputfile, sep = ",", row.names = FALSE,)

