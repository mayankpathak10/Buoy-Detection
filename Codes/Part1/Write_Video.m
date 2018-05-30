

close all;
clc;
%[colorSamples] = colorDistribution;
%[ModelParams] = estimate(colorSamples);
vidWriter=VideoWriter('Output_Video.mp4','MPEG-4');
VideoFolder = '../../ColorSeg/Outputs/Part3';

images = imageDatastore('../../ColorSeg/Outputs/Part3/Frames/*.jpg');  
nfiles = size(images.Files,1); 
open(vidWriter);
for i=1:nfiles
     disp(['Writing Frame NO.:',num2str(i)]);
     Input_Image = readimage(images,i);
     writeVideo(vidWriter,Input_Image);
     clc
end
close(vidWriter)
close all;  
