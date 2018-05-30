
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 0 (100 points)- Buoy Detection 
%
% This is the main file for executing Part 0 of this project. This file
% calls functions to generate average Color Histogram and to segment buoys
% using 1D Gaussian Model.
% 
% 
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code uses three functions,
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all 
%% For determining and Plotting Average Color Histogram
colorSamples = averageHistogram();

%% For estimating Model Parameters
RedBuoyData = double(cell2mat(colorSamples(1)));
GreenBuoyData = double(cell2mat(colorSamples(2)));
YellowBuoyData = double(cell2mat(colorSamples(3)));

colorSamplesR_LAB = RedBuoyData;
colorSamplesG_LAB = GreenBuoyData;
colorSamplesY_LAB = YellowBuoyData;

colorSamplesR = colorSamplesR_LAB(:, 1);
colorSamplesG = colorSamplesG_LAB(:, 2);
colorSamplesY = colorSamplesY_LAB(:, 3); 

%For Red Buoy
meanR = mean(colorSamplesR);
std_devR = std(colorSamplesR);
varianceR = std_devR^2;
ModelParamsR = [meanR, varianceR];

%For Green Buoy
meanG = mean(colorSamplesG);
std_devG = std(colorSamplesG);
varianceG = std_devG^2;
ModelParamsG = [meanG, varianceG];

%For Yellow Buoy
meanY = mean(colorSamplesY);
std_devY = std(colorSamplesY);
varianceY = std_devY^2;
ModelParamsY = [meanY, varianceY];

ModelParams = [ModelParamsR, ModelParamsG, ModelParamsY];

readFolder = '../../ColorSeg/Images/TestingSet/Frames';
writeFolder = '../../ColorSeg/Outputs/Part0/Frames';

%% For Detecting Buoys
for i = 1:8
    disp(['Frame No.: ',num2str(i)]);
    
    fileName = sprintf('%03d.jpg',i);
    thisfile =  fullfile(readFolder,fileName);

    Frame = imread(thisfile);
    [temp] = trial_segment(Frame, ModelParams);
    f = figure('Visible','off');
    imshow(temp) 
    
    filename = fullfile(writeFolder,fileName);
    saveas(f, filename) 
end

