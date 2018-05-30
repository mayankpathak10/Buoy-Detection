%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 0(10 points)- Buoy Detection 
%
% To divide the input video into frames and extract buoy images from it. 
% A total of 10 frames are picked from the video(with 200 frames) and the
% buoys are cropped using roipoly function.
%
%
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code has NO dependencies, just ensure that the path
% for reading the video file is correct and Path to save the cropped images
% is correct as well.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Buoy_Extraction 

close all

%%%% Video Path
Input_Video = VideoReader('../ColorSeg/Inputs/detectbuoy.avi');
TotalFrames = Input_Video.NumberOfframes;

n = TotalFrames;
folder = '../ColorSeg/Images/TrainingSet/CroppedBuoys';
Y = 'Y';
y= 'y';

PickedFrames = 10;     % The number of frames you want for extraction of Buoys
                       % (Keep it such that increment is feasable)
increment = TotalFrames/PickedFrames;
for i = 1:increment:n
    close all
    disp(['Frame no.= ',num2str(i)]);
    thisframe = read(Input_Video,i);
    
    %%%% For Selecting Red Buoy  %%%%
    figure;
    red_mask = roipoly(thisframe);
    RedbuoyinThisframe = bsxfun(@times, thisframe,cast(red_mask,class(thisframe)));
    imshow(RedbuoyinThisframe);
    binarized = im2bw(RedbuoyinThisframe);
    box=regionprops(binarized,'Area', 'BoundingBox'); 

    xmin = box.BoundingBox(1);
    ymin = box.BoundingBox(2);
    width = box.BoundingBox(3);
    height = box.BoundingBox(4);
    Cropped = imcrop(thisframe,[xmin,ymin,width,height]);
    imshow(Cropped);
    CroppedName = sprintf('r_%02d.jpg',i);
    FullName = sprintf('red_%02d.jpg',i);
    Croppedfile =  fullfile(folder,CroppedName);
    imwrite( Cropped, Croppedfile );
    Fullfile = fullfile(folder,FullName);
    imwrite( RedbuoyinThisframe, Fullfile );
    close all
    
    %%%% For Selecting Green Buoy %%%%
    prompt = 'Do you want to select Green buoy in this frame? Y/N [Y]: ';
    str1 = input(prompt);
    if isEmpty(str2)
        str2 = 'Y';
    end
    if str1 == Y || str1 == y
        green_mask = roipoly(thisframe);
        GreenbuoyinThisframe = bsxfun(@times, thisframe,cast(green_mask,class(thisframe)));
        binarized = im2bw(GreenbuoyinThisframe);
        box=regionprops(binarized,'Area', 'BoundingBox'); 

        xmin = box.BoundingBox(1);
        ymin = box.BoundingBox(2);
        width = box.BoundingBox(3);
        height = box.BoundingBox(4);

        Cropped = imcrop(thisframe,[xmin,ymin,width,height]);
        CroppedName = sprintf('g_%02d.jpg',i);
        FullName = sprintf('green_%02d.jpg',i);
        Croppedfile = fullfile(folder,CroppedName);
        imwrite( Cropped, Croppedfile );
        Fullfile = fullfile(folder,FullName);
        imwrite( GreenbuoyinThisframe, Fullfile );
        close all
    end
    
%%%% For Selecting yellow buoy  %%%%   
    prompt = 'Do you want to select Yellow buoy in this frame? Y/N [Y]: ';
    str2 = input(prompt,'s');
    if isEmpty(str2)
        str2 = 'Y';
    end
    if str2 == Y || str2 == y
        
        title('Select Yellow Buoy');
        yellow_mask = roipoly(thisframe);
        YellowbuoyinThisframe = bsxfun(@times, thisframe,cast(yellow_mask,class(thisframe)));
        binarized = im2bw(YellowbuoyinThisframe );
        box=regionprops(binarized,'Area', 'BoundingBox'); 
        xmin = box.BoundingBox(1);
        ymin = box.BoundingBox(2);
        width = box.BoundingBox(3);
        height = box.BoundingBox(4);

        Cropped = imcrop(thisframe,[xmin,ymin,width,height]);
        CroppedName = sprintf('y_%02d.jpg',i);
        FullName = sprintf('yellow_%02d.jpg',i);
        Croppedfile = fullfile(folder,CroppedName);
        imwrite( Cropped, Croppedfile );
        Fullfile = fullfile(folder,FullName);
        imwrite( YellowbuoyinThisframe, Fullfile );
        close all
    end
    
end
end