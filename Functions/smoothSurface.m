%smooth Surface will output a smoothed matrix,
%INPUTS: UnSmoothed Matrix and the number of times the avergaing function
%is run on the matrix.
function finalMatrix = smoothSurface(inputMatrix,numAvgd)
    recursiveMatrix = inputMatrix;
    
    for i = 1:numAvgd
        recursiveMatrix = avgProcess(recursiveMatrix);
    end
    
    finalMatrix = recursiveMatrix;
end

function avgdMatrix = avgProcess(inputMatrix)

    [h,w] = size(inputMatrix);
    avgdMatrix = zeros(h,w);
    
    for r = 1:h
        for c = 1:w
            
            avgdMatrix(r,c) = returnAvg(inputMatrix,r,c);
            %disp(returnAvg(inputMatrix,r,c));
        end
    end
end

%inputs the matrix to be smoothed and the index of where you are smoothing
%around
%outpts the average value of all surrounding values
function avgValue = returnAvg(inputMatrix,h,w)

    total = 0;
    numValid = 0;
    
    for r = 1:3
        for c = 1:3
            %determine index of the next value to check
            checkR = (h-2)+r;
            checkC = (w-2)+c;
            
            validity = isPointValid(inputMatrix,checkR,checkC);
            
            if(validity)
                total = total + inputMatrix(checkR,checkC);
                numValid = numValid + 1;
            end
            
            
        end
    end
    
    avgValue = total/numValid;
end

