This document is to explain the process behind the tidy data in run_analysis_tidy_data.txt.

Assuming 'getdat-projectfiles-UCI HAR Dataset' is already in your working directory:

For the test dataset, I cbind-ed subject_test, X_test, and y_test together, and then labeled them with the labels in features.txt.
Same with the training dataset.

I combined the test dataframe and train dataframes together, and then threw out all of the columns that didn't have "mean" or "std" in them.

I then computed the average of each column, which I wrote to run_analysis_tidy_data.txt.