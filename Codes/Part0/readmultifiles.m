%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 0(10 points)- Buoy Detection 
%
% This function reads the Buoys images and generates individual cell for 
% each colored buoy.
%
%
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code has NO dependencies, just ensure that the path
% for reading the video file is correct and Path to save the cropped images
% is correct as well.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [red,green,yellow] = readmultifiles
% Reading Green Bouy%
folder = '../../ColorSeg/Images/TrainingSet/CroppedBuoys';
filePattern = fullfile(folder, 'green_*.jpg');
f=dir(filePattern);
files={f.name};
for k=1:length(files)
    fullFileName = fullfile(folder, files{k});
    green{k}=imread(fullFileName);
end

% Reading Red Bouy%
folder = '../../ColorSeg/Images/TrainingSet/CroppedBuoys';
filePattern = fullfile(folder, 'red_*.jpg');
f=dir(filePattern);
files={f.name};
for k=1:length(files)
    fullFileName = fullfile(folder, files{k});
    red{k}=imread(fullFileName);
end

% Reading Yellow Bouy%
folder = '../../ColorSeg/Images/TrainingSet/CroppedBuoys';
filePattern = fullfile(folder, 'yellow_*.jpg');
f=dir(filePattern);
files={f.name};
for k=1:length(files)
    fullFileName = fullfile(folder, files{k});
    yellow{k}=imread(fullFileName);
end
 out = [red,green,yellow];
end
