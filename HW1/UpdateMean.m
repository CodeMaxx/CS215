function newMean = UpdateMean(oldMean,newDataValue,A,N)
    newMean = (oldMean*N + newDataValue)/(N+1);
    
