%MAIN FUNCTION

%Begin by adding the functions folder to house helper functions
addpath('Functions')

randSurface = generateSurface(30,50,10);

figure(1)
surf(randSurface); hold on
smoothedSurface = smoothSurface(randSurface,10);
figure(2)
surf(smoothedSurface);
