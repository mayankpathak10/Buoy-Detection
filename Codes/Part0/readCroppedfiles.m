%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 0(10 points)- Buoy Detection 
%
% This function reads the cropped Buoys images and generates individual
% cell for each colored buoy.
%
%
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code has NO dependencies, just ensure that the path
% for reading the video file is correct and Path to save the cropped images
% is correct as well.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Cred,Cgreen,Cyellow] = readCroppedfiles
% Reading Green Bouy%
folder = '../../ColorSeg/Images/TrainingSet/CroppedBuoys';
filePattern = fullfile(folder, 'g_*.jpg');
f=dir(filePattern);
files={f.name};
for k=1:length(files)
    fullFileName = fullfile(folder, files{k});
    Cgreen{k}=imread(fullFileName);
end

% Reading Red Bouy%
folder = '../../ColorSeg/Images/TrainingSet/CroppedBuoys';
filePattern = fullfile(folder, 'r_*.jpg');
f=dir(filePattern);
files={f.name};
for k=1:length(files)
    fullFileName = fullfile(folder, files{k});
    Cred{k}=imread(fullFileName);
end

% Reading Yellow Bouy%
folder = '../../ColorSeg/Images/TrainingSet/CroppedBuoys';
filePattern = fullfile(folder, 'y_*.jpg');
f=dir(filePattern);
files={f.name};
for k=1:length(files)
    fullFileName = fullfile(folder, files{k});
    Cyellow{k}=imread(fullFileName);
end
out = [Cred,Cgreen,Cyellow];
end
