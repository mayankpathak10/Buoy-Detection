%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 0(10 points)- Buoy Detection 
%
% This code takes input argument as all the samples of yellow buoys and
% threshold for  yellow color filtering, and returns the LAB images of the
% frames with buoys.
%
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code has NO dependencies, just ensure that the path
% for reading the video file is correct and Path to save the cropped images
% is correct as well.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Yellowbouy =labyellow(red,d)
Yellowbouy=[];
allYellowbouy=[];
imgcell = red;
[~,c] = size(imgcell);
for i = 1:c    
    imgrgb = cell2mat(imgcell(i));
    imglab = rgb2lab(imgrgb);
    [p,q,~] = size(imglab);

    B=imglab(1:p,1:q,3);
    B = cast(B,'int16');    
    
    ybouy = B(:,:,1) > d;
    
    ybouymain = (im2double(imgrgb).*ybouy);
    ybouymain = rgb2lab(ybouymain);
    
    LL=ybouymain(:,:,1);
    AA=ybouymain(:,:,2);
    BB=ybouymain(:,:,3);
    
    
    Ll = LL( BB>d);
    Aa = AA(BB>d);
    Bb = BB(BB>d);
    
    yellowinter =[Ll,Aa ,Bb];
    allYellowbouy = vertcat(allYellowbouy,yellowinter);
    Yellowbouy = allYellowbouy;  

end
end







