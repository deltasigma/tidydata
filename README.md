#Tidy Data Generator

## Running the script
Load the script into R and type run_analysis() and the script will do the rest.

This script process the raw files available as download on the course page:

* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Download the file and extract the content in some directory of your choice. After that, set the "datafiles" variable in the beginning of the script to match the directory of the features_info.txt file.

When you run the script the files will be automatically merged and the apropriate columns selected.

## Analisys
The script loads all the raw data in memory. It merges 3 files to create the main dataframe: the subject, X and Y files for the train and the test sets.

After creating one dataframe for the test set and another for the train set, the script merges both DF in one full DF and fix the column names.

The next step is to find the mean() and std() info. The name of the field come from the "features.txt" file. The script find the fields and subset the main dataframe to keep only the necessary columns

Now it replaces the codes for activities to the real names. This information come from the "activity_labels.txt" file.

Finally, the script generates the tidy dataset in a file on the working directory

In the end, the script will generate the tidy dataset as a .txt file in your working directory where the data is stored.
