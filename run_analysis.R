#load libs
library(reshape2)
#verifies if UCI HAR Dataset exits, if not it downloads and unzip the file

checksDir = function(sPath,url,rootFile){
  
  if (!file.exists(sPath)){
    print(paste(sPath," does not exists, trying to retrieve it from web."))
    #downloads zip file with data
    download.file(url,destfile = paste(rootFile,".zip",sep = ""),method = "auto")
    #renives recursively incomplete data dir
    unlink(rootFile,recursive = T)
    #unzips file
    unzip(paste(rootFile,".zip",sep = ""))
    unlink(paste(rootFile,".zip",sep = ""))
  } 
  
}

main = function(){ #main function, where the magic happens
  
  #data directory constant
  subDir = "UCI HAR Dataset"
  url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
  checksDir(subDir,url,subDir)
  
  ###loads all files needed
  #loads col names
  colNames = read.table("completeVariableDesc.vector")
  vColNames = as.vector(colNames$V1) #makes sure it's a vector
  #loads train independent data
  sPath = paste(subDir,"\\train\\X_train.txt",sep = "")
  checksDir(sPath,url,subDir)
  x_train_complete = read.table(sPath,col.names = vColNames,colClasses = "double")
  #loads test independent data
  sPath = paste(subDir,"\\test\\X_test.txt",sep = "")
  checksDir(sPath,url,subDir)
  x_test_complete = read.table(sPath,col.names = vColNames,colClasses = "double")
  #loads activities (Y variabe)
  sPath = paste(subDir,"\\train\\y_train.txt",sep = "")
  checksDir(sPath,url,subDir)
  y_train = read.table(sPath,header=F,col.names = "Activities_ID",colClasses = "integer")
  sPath = paste(subDir,"\\test\\y_test.txt",sep = "")
  checksDir(sPath,url,subDir)
  y_test = read.table(sPath,header=F,col.names = "Activities_ID")
  #loads activities descriptions
  sPath = paste(subDir,"\\activity_labels.txt",sep = "")
  checksDir(sPath,url,subDir)  
  y_labels = read.table(sPath,header=F,col.names =c("Activities_ID" ,"Activities_Label"),colClasses = c("integer","character"))
  #loads subjects data
  sPath = paste(subDir,"\\train\\subject_train.txt",sep = "")
  checksDir(sPath,url,subDir)  
  subjects_train = read.table(sPath,header=F,col.names = "Subjects_ID",colClasses = "integer")
  sPath = paste(subDir,"\\test\\subject_test.txt",sep = "")
  checksDir(sPath,url,subDir)  
  subjects_test = read.table(sPath,header=F,col.names = "Subjects_ID",colClasses = "integer")
  
  #concatenates x data, y data, subject data and activities id data
  train = cbind(x_train_complete,subjects_train,y_train)
  test = cbind(x_test_complete,subjects_test,y_test)
  
  #concatenates train and test data
  
  complete = rbind(train,test,deparse.level = 1)
  
  #drops all unwanted columns
  complete = complete[,c(1,2,3,41,42,43,81,82,83,121,122,123,161,162,163,201,214,227,240,253,266,267,268,345,346,347,424,425,426,503,516,529,542,4,5,6,44,45,46,84,85,86,124,125,126,164,165,166,202,215,228,241,254,269,270,271,348,349,350,427,428,429,504,517,530,543,562,563)]
  
  
  
  #merges acttivities name to ensure that the dataset is easy to understand
  complete = merge.data.frame(complete,y_labels,by = "Activities_ID")
  #create vector with value columns
  vValuesCol = names(complete[,sapply(complete, is.double)])
  #groups complete table by activity label and subject id, with an average function
  dfmComplete = melt(complete,id=c("Activities_Label","Subjects_ID"),measure.vars = vValuesCol)
  dfcComplete = dcast(dfmComplete, Activities_Label + Subjects_ID ~ variable,mean)
  #writes table to dir
  write.table(dfcComplete,file = "reshapedDataActivitiesSubjects",row.names = F,sep="|")
  print("Script finished")
}



main() #starts script