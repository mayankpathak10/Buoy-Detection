%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 3 (100 points)- Buoy Detection 
%
% This is the main file for executing Part 3 of this project. This file
% calls functions to generate average Color Histogram and to segment buoys
% using Gaussian Mixture Model.
% 
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code uses three functions, 'averageHistogram',
% 'estimate', and 'detectBuoy'.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

colorSamples = averageHistogram();
ModelParams = estimate(colorSamples);

readFolder = '../../ColorSeg/Images/TestingSet/Frames';
writeFolder = '../../ColorSeg/Outputs/Part3/Frames';
binaryFolder = '../../ColorSeg/Outputs/Part3';
    
for i = 1:200
     disp(['Frame No.: ',num2str(i)]);
    
    fileName = sprintf('%03d.jpg',i);
    writefile_name = sprintf('out_%03d.jpg',i);
    binarized_name = sprintf('binary_%03d.jpg',i);
    thisfile =  fullfile(readFolder,fileName);
    
    FrameID = imread(thisfile);
    [temp] = detectBuoy(FrameID, ModelParams);
    f = figure('Visible','off');
    imshow(temp)
%     img = frame2im(f);
    binarized = im2bw(temp);
    binarized_file = fullfile(binaryFolder,binarized_name);
%     saveas(binarized,binarized_file)
    imwrite(binarized,binarized_file);
    
    filename = fullfile(writeFolder,writefile_name);
    saveas(f, filename)
end