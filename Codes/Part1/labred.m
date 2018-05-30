%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 3(10 points)- Buoy Detection 
%
% This code takes input argument as all the samples of red buoys and
% threshold for  red color filtering, and returns the LAB images of the
% frames with buoys.
%
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code has NO dependencies, just ensure that the path
% for reading the video file is correct and Path to save the cropped images
% is correct as well.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function RedBuoy =labred(red,d)
RedBuoy=[];
allRedbouy=[];
imgcell = red;
[~,c] = size(imgcell);
for i = 1:c
    imgrgb = cell2mat(imgcell(i));
    imglab = rgb2lab(imgrgb);
    [p,q,~] = size(imglab);
    %     Taking LAB Values
    
    A=imglab(1:p,1:q,2);
    A = cast(A,'int16');
    
    rbouy = A(:,:,1) > d;
    redbouy = (im2double(imgrgb).*rbouy);
    redbouy = rgb2lab(redbouy);
    
    LL=redbouy(:,:,1);
    AA=redbouy(:,:,2);
    BB=redbouy(:,:,3);
    
    Ll = LL( AA>d);
    Aa = AA(AA>d);
    Bb = BB(AA>d);
 
    redinter =[Ll ,Aa ,Bb];
    allRedbouy = vertcat(allRedbouy,redinter);
    RedBuoy = allRedbouy;

end
end







