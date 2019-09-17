
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
    
    point = inMatrix(h,w);
    if(point == 999)
        isValid = false;
    else
        isValid = true;
    end
end

end