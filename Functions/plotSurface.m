function plotSurface(inMatrix)
    
% [h,w] = size(inMatrix);
% cumulative = 0;

% for r = 1:h
%     
%     for c = 1:w
%        
%         cumulative = cumulative + 1;
%         
%         X1(cumulative) = c;
%         Y1(cumulative) = r;
%         Z1(cumulative) = inMatrix(r,c);
%         
%     end
% end

%surf(Y1,X1,Z1);
surf(inMatrix);
end

