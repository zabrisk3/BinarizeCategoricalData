binarizeFull= function(filename)
{
    File=toString(filename)
    read = read.csv(paste(toString(filename),".csv", sep=""),header = TRUE)
    newFrame=data.frame(read)
    columnNames=names(newFrame)
    categorical_index=vector()
    noOfColumns=ncol(newFrame)
    columnLength = nrow(newFrame)
    
    for (i in 1:noOfColumns) {
        print(columnNames[i])
        isCategorical=findType(newFrame, i)
        if(isCategorical){
            categorical_index=c(categorical_index, i)
            categories=unique(newFrame[[i]])
            x=categories[1]
            uniqueFrame=unique(newFrame[[i]])
            cleanedCategories=nonBlankunique(categories)
            n=length(cleanedCategories)
            print(n)
            for (j in 1:n) {
                covs=data.frame(as.vector(numeric(columnLength)))
                newFrame=data.frame(cbind(newFrame,covs))
                number_of_columns=(length(names(newFrame)))
                colnames(newFrame)[number_of_columns] = paste(toString(columnNames[i]), toString(cleanedCategories[j]), sep= "__")
                for (k in 1:columnLength) {
                    if (toString(newFrame[[i]][k])==toString(cleanedCategories[j])) {
                        newFrame[[number_of_columns]][k]=1
                    }
                    if (toString(newFrame[[i]][k])=="" || is.na(newFrame[[i]][k]) || tolower(newFrame[[i]][k])=="na"){
                        newFrame[[number_of_columns]][k]=""
                    }
                }
            }
        }
    }
    
    newFrame = newFrame[-c(categorical_index)]
    newFilename=paste(toString(filename), "binarized", sep="")
    write.csv(newFrame, paste(newFilename,".csv", sep=""), row.names=FALSE)
    print("Done")
}

findType=function(columnList, index) {
    #truth=0
    for (i in 1: length(columnList[[index]]))
    {
        if(sapply(columnList[[index]][i], class)=="factor") {
            return (TRUE)
        }
    }
    return (FALSE)
    
}

nonBlankunique=function(givenList) {
    indexList=vector()
    for(i in 1:length(givenList)) {
        if (!(is.na(givenList[i]) || givenList[i]==""|| tolower(givenList[i])=='na'))
        {
            indexList=c(indexList,toString(givenList[i]))
        }
    }
    return (indexList)
}
binarizeFull("testframe")
