%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 3 (10 points)- Buoy Detection 
%
% This function read the cropped buoy images that are generated by the
% function named 'Buoy_Extraction' and generates Histogram plot for each
% colored Buoy. Also it returns the Buoy Images in the form of a cell
% containing arrays of each colored buoy images. 
% [colorSamples] = [red,green,yellow]
% 
% 
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code uses four function, namely
% 'readCroppedfiles','readmultifiles','hist_Plot','average_colorHist'.
% Later two are defined in this file itself.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [colorSamples] = averageHistogram( input_args )

% Create color Samples from Buoy images
[red,green,yellow] = readmultifiles;

% Cropped Buoy images for eliminating black background
[Cred,Cgreen,Cyellow] = readCroppedfiles;

% Threshold for filtering colors
tred = 28;
tgreen = -45;
tyellow = 50;

Redbouy = labred(red,tred);
Greenbouy = labgreen(green,tgreen);
Yellowbouy = labyellow(yellow,tyellow);
allbouy = {Redbouy,Greenbouy,Yellowbouy}; 

hist_Plot(Redbouy,'red')
hist_Plot(Greenbouy,'green')
hist_Plot(Yellowbouy,'yellow')

colorSamples = allbouy;

average_colorHist(Cred,'red');
average_colorHist(Cgreen,'green');
average_colorHist(Cyellow,'yellow');

end

function hist_Plot(Bouy,color)

writeFolder = '../../ColorSeg/Outputs/Part3';
fileName = [color,'_hist'];
color = ['.',color];
rr = Bouy(:,1);
gg = Bouy(:,2);
bb = Bouy(:,3);
fig1 = figure;
plot3(rr,gg,bb,color)
filename = fullfile(writeFolder,fileName);
saveas(fig1, filename,'jpg')
end

function average_colorHist(colorcell,color)

[~,c] = size(colorcell);
tr = zeros(256,1);
tg = zeros(256,1);
tb = zeros(256,1);
    for i = 1:c
        imgrgb = cell2mat(colorcell(i));
        Red = imgrgb(:,:,1);
        Green = imgrgb(:,:,2);
        Blue = imgrgb(:,:,3);

        [yRed, x1] = imhist(Red);
        [yGreen, x2] = imhist(Green);
        [yBlue, x3] = imhist(Blue);
     
        tr =  tr + yRed;
        tg = tg + yGreen;
        tb = tb + yBlue;

    end

    tr = tr/c;
    tg = tg/c;
    tb = tb/c;
    fig1 = figure;
    plot(x1, tr, 'Red', x2, tg, 'Green', x3, tb, 'Blue');
    filename = ['../../ColorSeg/Outputs/Part3/',color,'_hist'];
    saveas(fig1,filename,'jpg');

end
