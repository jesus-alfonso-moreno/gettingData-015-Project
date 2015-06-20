###loads all files needed
#loads col names
colNames = read.table("completeVariableDesc.vector")
vColNames = as.vector(colNames) #makes sure it's a vector
#loads train independent data
x_train_complete = read.table("UCI HAR Dataset\\train\\X_train.txt",col.names = vcolNames,colClasses = "numeric")
#loads test independent data
x_test_complete = read.table("UCI HAR Dataset\\test\\X_test.txt",col.names = vcolNames,colClasses = "numeric")
#loads activities (Y variabe)
#loads 