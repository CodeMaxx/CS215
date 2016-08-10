function newMean = UpdateMean(OldMean,NewDataValue,A,N)
    newMean = (OldMean*N + NewDataValue)/(N+1);
    
