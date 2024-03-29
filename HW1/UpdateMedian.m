function newMedian = UpdateMedian(oldMedian,NewDataValue,A,N)
    if mod(N,2) == 0
        if NewDataValue >= oldMedian 
            if NewDataValue <= A(1,N/2+1)
                newMedian = NewDataValue;
            else
                newMedian = A(1,N/2+1);
            end
        else
            if NewDataValue <= A(1,N/2)
                newMedian  = A(N/2);
            else
                newMedian = NewDataValue;
            end
        end
    else
        if N == 1
            newMedian = (oldMedian + NewDataValue)/2;
        else
            if NewDataValue >= oldMedian
                if NewDataValue >= A(1,(N + 1)/2 + 1)
                    newMedian = (oldMedian + A(1,(N+1)/2 + 1))/2;
                else
                    newMedian = (oldMedian + NewDataValue)/2;
                end
            else
                if NewDataValue <= A(1,(N+1)/2 - 1)
                    newMedian = (oldMedian + A(1,(N+1)/2 - 1))/2;
                else
                    newMedian = (oldMedian + NewDataValue)/2;
                end
            end
        end
    end
                
        