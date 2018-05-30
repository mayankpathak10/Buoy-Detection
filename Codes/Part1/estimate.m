%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENPM 673 Perception For Autonomous Robotics
% PROJECT 3  - Spring 2018
%
% Question Part 3 (100 points)- Buoy Detection 
%
% This function estimates the model parameters according to the
% colorsamples that it takes as input arguments. It makes use of 3 1D
% gaussian mixture model for identifying buoys. 
% 
% Code By: Mayank Pathak
%          115555037
%
% Dependencies: This code uses NO funcitons, hence no dependencies.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [ModelParams] = estimate( colorSamples )

%%%% Extracting individual Buoy data
RedBuoyData = double(cell2mat(colorSamples(1)));
GreenBuoyData = double(cell2mat(colorSamples(2)));
YellowBuoyData = double(cell2mat(colorSamples(3)));

%%%% 1-D GMM fitting for each buoy 
options = statset('Display','final', 'MaxIter', 200);

% GMM on each colored buoy
objR = gmdistribution.fit(RedBuoyData,3,'Options',options);
objG = gmdistribution.fit(GreenBuoyData,3,'Options',options);
objY = gmdistribution.fit(YellowBuoyData,4,'Options',options);

% covariance for each buoy
covR = objR.Sigma;
covG = objG.Sigma;
covY = objY.Sigma;

% Mean for each buoy
meansR = objR.mu;
meansG = objG.mu;
meansY = objY.mu;


ModelParams = {meansR, covR, meansG, covG, meansY, covY };

end

