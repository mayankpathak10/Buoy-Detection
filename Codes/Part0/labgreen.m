%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 0(10 points)- Buoy Detection 
%
% This code takes input argument as all the samples of green buoys and
% threshold for green color filtering, and returns the LAB images of the
% frames with buoys.
%
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code has NO dependencies, just ensure that the path
% for reading the video file is correct and Path to save the cropped images
% is correct as well.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function GreenBuoy =labgreen(green,d)
GreenBuoy=[];
allGreenbouy=[];
imgcell = green;
[~,c] = size(imgcell);
for i = 1:c
    imgrgb = cell2mat(imgcell(i));
    imglab = rgb2lab(imgrgb);
    [p,q,~] = size(imglab);
   
    A=imglab(1:p,1:q,2);
    A = cast(A,'int16');
    
    gbouy = A(:,:,1) <= d;
    
    greenbouy = (im2double(imgrgb).*gbouy);
    greenbouy = rgb2lab(greenbouy);
    LL=greenbouy(:,:,1);
    AA=greenbouy(:,:,2);
    BB=greenbouy(:,:,3);
    
    Ll = LL( AA<=d);
    Aa = AA(AA<=d);
    Bb = BB(AA<=d);
  
    
    greenir =[Ll ,Aa ,Bb];
    allGreenbouy = vertcat(allGreenbouy,greenir);
    GreenBuoy = allGreenbouy;  
    
end
end







