run_analysis <- function() {
  print(paste(Sys.time(),"*** Begin ***"))
  #vfolderresult <- "UCI-HAR-Dataset-Tidy"
  #vfolderread <- "UCI-HAR-Dataset"
  #if (!dir.exists(vfolderread)) {
  #  print(paste(Sys.time(),"*** ERROR *** No data"))
  #  setwd("..\\")
  #  return()
  #}
  #if (!dir.exists(vfolderresult)) {
  #  dir.create(vfolderresult)
  #  print(paste(Sys.time(),"- Creating folder for the result"))
  #}
  library(plyr)
  library(dplyr)
  #Read all in datasets
  #setwd(vfolderread)

  print(paste(Sys.time(),"- Reading and Renaming var in test and train activities"))
  DF_test_activity <- read.table(".\\test\\y_test.txt")
  names(DF_test_activity) <- c("activity")
  DF_test_activity <- mutate(DF_test_activity, typeobservation = "test")
  DF_train_activity <- read.table(".\\train\\y_train.txt")
  names(DF_train_activity) <- c("activity")
  DF_train_activity <- mutate(DF_train_activity, typeobservation = "training")
  
  print(paste(Sys.time(),"- Reading and Renaming var in test and train subjects"))
  DF_test_subject <- read.table(".\\test\\subject_test.txt")
  names(DF_test_subject) <- c("subject")
  DF_train_subject <- read.table(".\\train\\subject_train.txt")
  names(DF_train_subject) <- c("subject")

  print(paste(Sys.time(),"- Reading Variables in test and train"))
  DF_test_variables <- read.table(".\\test\\X_test.txt")
  DF_train_variables <- read.table(".\\train\\X_train.txt")
  
  print(paste(Sys.time(),"- Reading features and activities"))
  DF_names_variables <- read.table(".\\features.txt")
  DF_names_activities <- read.table(".\\activity_labels.txt")
  
  #select only the columns mean and std
  print(paste(Sys.time(),"- Select columns for mean and std"))
  vcols <- grep(".(-mean|-std).", DF_names_variables$V2, value = TRUE)
  vcolsn <- match(vcols, DF_names_variables$V2)
  DF_test_variables <- select(DF_test_variables, vcolsn)
  DF_train_variables <- select(DF_train_variables, vcolsn)

  #Rename variables
  print(paste(Sys.time(),"- Renaming variables"))
  vcols <- gsub("[[:punct:]]","", vcols)
  vcols <- sub("^t","Time", vcols)
  vcols <- sub("^f","Frequency", vcols)
  names(DF_test_variables) <- vcols
  names(DF_train_variables) <- vcols
    
  #Change code by value in activities
  print(paste(Sys.time(),"- Coverting Activities for test and train, code to value"))
  for(i in 1:6) {
    DF_test_activity$activity <- sub(DF_names_activities$V1[i], 
                                         DF_names_activities$V2[i], 
                                         DF_test_activity$activity)
    DF_train_activity$activity <- sub(DF_names_activities$V1[i], 
                                     DF_names_activities$V2[i], 
                                     DF_train_activity$activity)
  }
  
  #Join an Match DataSets
  print(paste(Sys.time(),"- Adding columns for test and train"))
  DF_test <- cbind(DF_test_activity, DF_test_subject, DF_test_variables)
  DF_train <- cbind(DF_train_activity, DF_train_subject, DF_train_variables)

  print(paste(Sys.time(),"- Adding rows for test and train"))
  DF <- rbind(DF_test, DF_train)

  print(paste(Sys.time(),"- Creating new dataset - Averages"))
  DF_avet <- DF %>% 
            group_by(activity, subject) %>% 
            summarize_at(names(DF)[4:length(names(DF))], mean)

  #Write the Tidy DataSet
  #setwd(paste("..\\", vfolderresult, sep = ""))
  
  print(paste(Sys.time(),"- Writting TXT's for test and train"))
  write.table(DF, "DF_result.txt", row.names = FALSE)
  write.table(DF_avet, "DF_result_ave.txt", row.names = FALSE)
  
  #Set the current folder
  setwd("..\\")
  print(paste(Sys.time(),"*** The end ***"))
}
