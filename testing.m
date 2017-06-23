% Name: testing.m
% type: object recogination  
% description: open the file in mat lab and run the script it will start
% takimng the images from the web cam and extract the object from the image
% s of the video and display the object name in a pop up window.
% contact-us: https://learn-kevin.blogspot.com
% Email :     sidd5sci@gmail.com
%
% =========================================================================
%                       Object Recogination Testing
% =========================================================================

% clearing
clc
close all
clear all 
% adding paths of xml files and input images
addpath('inputSet');
addpath('XML Files');

%% Initiate the detectors for detecting the objects 
% init the dilog box for the input of the detector
prompt = {'Enter the detector name:'};
dlg_title = 'Name';
num_lines = 1;
defaultans = {'laptop'};
detectorType = inputdlg(prompt,dlg_title,num_lines,defaultans);
% checking the detector type send by user for the initiation
if strcmp(detectorType,'laptop')
    Detector = vision.CascadeObjectDetector('laptopdetector_9_25.xml');
elseif strcmp(detectorType,'bike')
    Detector = vision.CascadeObjectDetector('bikedetector_9_25.xml');
elseif strcmp(detectorType,'human')
    Detector = vision.CascadeObjectDetector('humandetector_9_25.xml');
end

%% initilising the webcam
vid = videoinput('winvideo',1,'YUY2_320x240');
% set the farme rate of video from webcam
% set(vid,'FramePerTrigger',Inf);
% set the camera color formate
%set(vid,'ReturnedColorspace','rgb');
% set the frame interval 
%vid.FrameGrabinterval = 5;
% start the webcam 
start(vid);
%preview(vid);

%% Initiate the detectors for detecting the objects 
% init the dilog box for the input of the detector
prompt = {'Enter the input type:'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'webcam'};
inputType = inputdlg(prompt,dlg_title,num_lines,defaultans);
% checking the detector type send by user for the 
if strcmp(inputType,'webcam')
    %% detect the image from the web cam images 
    % counter 
    i = 0;
    % main loop 
    while( i <100)
        % taking a snapshot of from the video and storeing it in the image
        % variable 
        img = getsnapshot(vid);
        % converting the image in to gary scale 
        img = rgb2gray(img);
        % figure;
        % display the grayscale image to wthe window
        % imshow(image);
        % detect the image from the image using detector
        bbox = step(Detector,img);
        % inset the detected boundary in to the image
        J = insertShape(img,'rectangle',bbox);
        % display the detected region over the input image
        imshow(J)



        % increase the counter 
        i = i + 1;

    end
elseif strcmp(inputType,'image')
        %% deltect the object from the input images 
        % init the dilog box for the input of the detector
        prompt = {'Enter the image name(.jpg):'};
        dlg_title = 'Name';
        num_lines = 1;
        defaultans = {'laptop (126)'};
        % taking the image name from the user
        imageName = inputdlg(prompt,dlg_title,num_lines,defaultans);
        % concating the extention
        loadImage = strcat(imageName,'.jpg');
        % checking the image send by user for the detection
        s = char(strcat('InputSet\',loadImage));
        % load the input image from input set 
        img = imread(s);
        % detect the image from the image using detector
        bbox = step(Detector,img);
        % inset the detected boundary in to the image
        J = insertShape(img,'rectangle',bbox);
        % display the detected region over the input image
        imshow(J)
end



%% cleaning the detector
release(Detector);

%% stop the video
%stop(vid)
%flushdata(vid);
clear all



