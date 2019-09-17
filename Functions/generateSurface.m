%NOTE TO SELF
%change so its just a matrix of Z values and have the indexes of height and
%width be your X and Y


%OutputSurface will generate and severely average a 3 dimensional surface
function outputSurface = generateSurface(h,w,RAND_MAG)
%initialize output surface with a given resolution
%999 given to detect weather the surface has been written to or not
%All XYZ pos will be given as vertical pairs of 3 interally in the matrix
%Therefore the output matrix will hold height*w data points, however the
%actual matrix will be 3 times taller to account for x and y positional
%data
outputSurface = zeros(h,w)+999;

%RANDOM MATRIX PRODUCTION
%=====================================================================
%index through the width
for c = 1:w
    
    %index through the height for each width position
    for r = 1:h
        
        %set an initial condition
        if(r == 1 && c == 1)
            %sets an intial value to scale all other points from
            begingingValue = rand()*RAND_MAG*2;
            
            %constructs X Y Z point in space
            %sets it to the first matrix pos
            outputSurface(r,c) = begingingValue;  %==z POS==
        else
            
            outputSurface = setNewPoint(outputSurface,r,c,RAND_MAG);
            
        end
        
    end
end
%END RANDOM MATRIX PRODUCTION
%=====================================================================

end

function updatedMatrix = setNewPoint(inMatrix,h,w,RAND_MAG)
%checks surrounding points and averages them
%sets the new point to a random number near the calculated average
%this produces natural deviation that still feels relatively continuously

%Visual of checked region
%"x" is the current pos
%"#" is a checked point

%   # # #
%   # X #
%   # # #

%accumulative
numPointsAvgd = 0;
total = 0;

%MAGNITUDE OF RANDOMNESS
% RAND_MAG = 5;

% for c = 1:3
%
%     %sets usable W for 3 indexes
%     currW = w+(c-2);
%
%     for r = 1:3
%
%         currH = height+(r-2);
%
%         realX = currH*3-2;
%         realY = currH*3-1;
%         realZ = currH*3;
%
%         if(isPointValid(inMatrix,currW,realZ))
%
%             total = total + inMatrix(currW,realZ);
%             numPointsAvgd = numPointsAvgd + 1;
%         end
%
%
%     end
%
% end
%================================================================

if(isPointValid ( inMatrix, h, (w-1) ) )
    
    total = total + inMatrix( h ,(w-1) );
    numPointsAvgd = numPointsAvgd + 1;
    %disp("yesX")
end


if(isPointValid ( inMatrix, (h-1) , w ) )
    
    total = total + inMatrix( (h-1) , w );
    numPointsAvgd = numPointsAvgd + 1;
    %disp("yesY")
end
%================================================================
updatedZ = (total/numPointsAvgd) + (rand()-0.5)*RAND_MAG;

updatedMatrix = inMatrix;
%update the X Y and Z of the matrix
updatedMatrix(h,w) = updatedZ;

%disp(numPointsAvgd);
%disp("============NEXT==============")
end

