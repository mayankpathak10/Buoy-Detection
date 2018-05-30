%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 0 (100 points)- Buoy Detection 
%
% This function takes input argument as Current Frame, and Model Parameters,
% and generates a 1D gaussian model for each
% 
% 
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code uses three functions,
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ temp ] = segment1D( Frame, ModelParams )

% Thresholds for probabilites
threshR = 0.0001;
threshG = 0.005;
threshY = 0.005;

% Detect Red Buoy
Frame_R_prob = zeros(size(Frame,1), size(Frame,2));
Frame_G_prob = zeros(size(Frame,1), size(Frame,2));
Frame_Y_prob = zeros(size(Frame,1), size(Frame,2));

meanR = ModelParams(1);
varianceR = ModelParams(2);
meanG = ModelParams(3);
varianceG = ModelParams(4);
meanY = ModelParams(5);
varianceY = ModelParams(6);

x = rgb2lab(Frame);
writeFolder = '../ColorSeg/Outputs/Part0/Temp';

for i = 1: size(Frame, 1)
    for j = 1: size(Frame, 2)

        xR = double(x(i,j,2)); 
        xG = double(x(i,j,2)); 
        xY = double(x(i,j,3));
        
        Frame_R_prob(i,j) = exp(-((xR-meanR)^2)/(2*varianceR));
        Frame_R_prob(i,j) = (1/(sqrt(2*pi*varianceR)))*Frame_R_prob(i,j);
        
        Frame_G_prob(i,j) = exp(-((xG-meanG)^2)/(2*varianceG));
        Frame_G_prob(i,j) = (1/(sqrt(2*pi*varianceG)))*Frame_G_prob(i,j);
        
        Frame_Y_prob(i,j) = exp(-((xY-meanY)^2)/(2*varianceY));
        Frame_Y_prob(i,j) = (1/(sqrt(2*pi*varianceY)))*Frame_Y_prob(i,j);
        
        if(Frame_R_prob(i,j)>threshR)
            Frame_R_prob(i,j) = 1;
        else
            Frame_R_prob(i,j) = 0;
        end
        
        if(Frame_G_prob(i,j)>threshG)
            Frame_G_prob(i,j) = 1;
        else
            Frame_G_prob(i,j) = 0;
        end
        
        if(Frame_Y_prob(i,j)>threshY)
            Frame_Y_prob(i,j) = 1;
        else
            Frame_Y_prob(i,j) = 0;
        end
        
    end
end


f = figure('Visible','off');

temp = Frame_R_prob;

imshow(Frame_R_prob);
tempR = bwmorph(Frame_R_prob,'erode', 1);
tempG = bwmorph(Frame_G_prob,'erode', 1);
tempY = bwmorph(Frame_Y_prob,'erode', 1);


Frame_R_prob = tempR;
Frame_G_prob = tempG;
Frame_Y_prob = tempY;

imshow(Frame);

statsR = regionprops('table',Frame_R_prob,'Centroid','MajorAxisLength','MinorAxisLength');
centersR = statsR.Centroid;
diametersR = (statsR.MinorAxisLength + statsR.MajorAxisLength)/2;

radiiR = diametersR./2;
hold on
viscircles(centersR,radiiR,'Color','r');


statsG = regionprops('table',Frame_G_prob,'Centroid','MajorAxisLength','MinorAxisLength');
centersG = statsG.Centroid;
diametersG = mean([statsG.MajorAxisLength statsG.MinorAxisLength],2);
radiiG = diametersG./2;
hold on
viscircles(centersG,radiiG,'Color','g');

statsY = regionprops('table',Frame_Y_prob,'Centroid','MajorAxisLength','MinorAxisLength');
centersY = statsY.Centroid;
diametersY = mean([statsY.MajorAxisLength statsY.MinorAxisLength],2);
radiiY = diametersY./2;
hold on
viscircles(centersY,radiiY,'Color','y');


thisfile =  fullfile(writeFolder,'I.jpg');
saveas(f,thisfile);

temp = imread(thisfile);

end

