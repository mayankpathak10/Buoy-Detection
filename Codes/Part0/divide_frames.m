%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 0(10 points)- Buoy Detection 
%
% To divide the input video into frames for testing and training purposes.
% This Code interactively prompts the user to give the number of frames
% he/she wants for training.
%
%
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code has NO dependencies, just ensure that the path
% for reading the video file is correct and Path to save the cropped images
% is correct as well.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function divide_frames 

Input_Video = VideoReader('../ColorSeg/Inputs/detectbuoy.avi');
NumofFrames = Input_Video.NumberOfframes;

n = NumofFrames;
Trainingfolder = '../ColorSeg/Images/TrainingSet/Frames';
Testingfolder = '../ColorSeg/Images/TestingSet/Frames';
cnt1 = 1;
cnt2 = 1;
prompt = {'Enter the number of Frames to train for: \n [Total Frames: 200 \n (Ex. 10 / 20)'};
title = 'Frames Count Selection';
dims = [1 35];
definput = {'40'};
answer = inputdlg(prompt,title,dims,definput);
answer = str2num(answer{1,1});
increment = n / answer;
ii = increment;

for i = 1:n
    frame = read(Input_Video,i);
    fileName = sprintf('%03d.jpg',i);
    if i == increment 
        thisfile =  fullfile(Trainingfolder,fileName);
        imwrite(frame,thisfile);
        im_training{cnt1} = frame;
        cnt1 = cnt1 + 1;
        increment  = increment + ii;
        
    else
        thisfile =  fullfile(Testingfolder,fileName);
        imwrite(frame,thisfile);
        im_test{cnt2} = frame;
        cnt2 = cnt2 + 1;
    end
end

end