run_analysis <- function() {

        ## get labels from features.txt to label dataframe later on
        labels <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\features.txt")
        labels <- c("Subject", "label", as.character(labels[,2]))
                
        ## read in test files, combine into test df, and label
        subject_test <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt")
        X_test       <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt")
        y_test       <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt")
        
        test <- cbind(
                        subject_test,
                        y_test,
                        X_test
                     )
        
        colnames(test) <- labels
        
        ## read in train files, combine into train df, and label
        subject_train <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt")
        X_train       <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt")
        y_train       <- read.table("getdata-projectfiles-UCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt")
        
        train <- cbind(
                        subject_train,
                        y_train,
                        X_train
                      )
        
        colnames(train) <- labels
        
        ## combine test and train dfs
        dataset <- tbl_df(rbind(train, test))
        colnames(dataset) <- labels
        
        ## select only columns measuring mean or stdev
        tidy.data <- dataset[,grepl("mean|std", colnames(dataset), ignore.case = TRUE)]
        
        ## compute average of columns in tidy.data
        summary <- t(data.frame(apply(tidy.data, 2, mean)))
        colnames(summary) <- colnames(tidy.data)
        
        ## write summary to file
        write.table(summary, "run_analysis_tidy_data.txt", row.name = FALSE)
        
        summary
}