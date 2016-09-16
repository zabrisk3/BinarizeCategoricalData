# Binarize Categorical Data
Binarizing categorical data is often useful when doing modeling, predictions, or some other form of analysis. 
The r-script provided will find categorical data present within a dataframe and binarize all columns
containing categorical data. 

The process of binarizing data is best illustrated with an example: 

A column for color containing the values "red", "green", and "blue" is binarized by being replaced with three
columns, Color_Red, Color_Green, and Color_Blue; a "red" value in the original column corresponds to a value
of 1 in Color_Red, and values of 0's in Color_Green, and Color_Blue. 

A sample input, testframe.csv, and sample output, binarized testFrame.csv, are provided to illustrate the process.
Blanks are included in the testframe file to show how binarization handles them. Though these examples are relatively small, 
this will work on much larger data sets as well. 
