function newStd = UpdateStd(OldMean,OldStd,NewMean,NewDataValue,A,N)
    newStd = sqrt((((OldStd)^2)*(N-1) + N*(OldMean)^2 - (N+1)*NewMean^2 + NewDataValue^2 )/N);