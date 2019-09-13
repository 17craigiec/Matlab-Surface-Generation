%NOTE TO SELF
%change so its just a matrix of Z values and have the indexes of height and
%width be your X and Y


%OutputSurface will generate and severely average a 3 dimensional surface
function outputSurface = generateSurface(height,w)
%initialize output surface with a given resolution
%999 given to detect weather the surface has been written to or not
%All XYZ pos will be given as vertical pairs of 3 interally in the matrix
%Therefore the output matrix will hold height*w data points, however the
%actual matrix will be 3 times taller to account for x and y positional
%data
h = height*3;
outputSurface = zeros(h,w)+999;

%RANDOM MATRIX PRODUCTION
%=====================================================================
%index through the width
for c = 1:w
    
    %index through the height for each width position
    for r = 1:height
        
        %set an initial condition
        if(r == 1 && c == 1)
            %sets an intial value to scale all other points from
            begingingValue = rand()*10;
            
            %constructs X Y Z point in space
            %sets it to the first matrix pos
            outputSurface(r,1)      =               1;  %==X POS==
            outputSurface(r+1,1)    =               1;  %==Y POS==
            outputSurface(r+2,1)    =  begingingValue;  %==z POS==
        else
            
            outputSurface = setNewPoint(outputSurface,r,c);
            
        end
        
    end
end
%END RANDOM MATRIX PRODUCTION
%=====================================================================

end

function isValid = isPointValid(inMatrix,h,w)
%determines if the index selected can be used for calculation
%EG, the point is within the functional parameters of the matrix
%or that t his said point has been written to

%point must be written to EG not 999
%999 is initialized unwritten state

[height, width] = size(inMatrix);

if( (h < 1) || (w < 1) || (h > height) || (w > width) )
    isValid = false;
else
    
    point = inMatrix(3*h,w);
    if(point == 999)
        isValid = false;
    else
        isValid = true;
    end
end

end

function updatedMatrix = setNewPoint(inMatrix,height,w)
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
RAND_MAG = 0;

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
realZ = height*3;

if(isPointValid ( inMatrix, height, (w-1) ) )
    
    total = total + inMatrix( realZ ,(w-1) );
    numPointsAvgd = numPointsAvgd + 1;
    disp("yesX")
end


if(isPointValid ( inMatrix, (height-1) , w ) )
    
    total = total + inMatrix( realZ , w );
    numPointsAvgd = numPointsAvgd + 1;
    disp("yesY")
end
%================================================================
updatedZ = (total/numPointsAvgd) + (rand()-0.5)*RAND_MAG;

updatedMatrix = inMatrix;
%update the X Y and Z of the matrix
updatedMatrix(height*3-2,w) = w;
updatedMatrix(height*3-1,w) = height;
updatedMatrix(height*3  ,w) = updatedZ;

disp(numPointsAvgd);
disp("============NEXT==============")
end
