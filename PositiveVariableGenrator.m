
%% clear all the previous content
clc
clear
clear all 

%% adding paths of xml files and input images
addpath('database');
addpath('XML Files');
%% Initiate the image labler
% init the dilog box for the input of the detector
prompt = {'Enter the object name to label:'};
dlg_title = 'Name';
num_lines = 1;
defaultans = {'human'};
labelType = inputdlg(prompt,dlg_title,num_lines,defaultans);

if strcmp(labelType,'laptop')
    loadImages = 'database\laptop';
elseif strcmp(labelType,'bike')
    loadImages = 'database\bike';
elseif strcmp(labelType,'human')
    loadImages = 'database\human';
end
% Initiate the image labler
trainingImageLabeler(loadImages);