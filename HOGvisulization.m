vid = videoinput('winvideo',1,'YUY2_320x240');
start(vid);
preview(vid);
image = getsnapshot(vid);
% converting the image in to gary scale 
image = rgb2gray(image);
% display the grayscale image to wthe window
imshow(image);
    
%% Extract HOG Features
[hog16, vis16] = extractHOGFeatures(image,'CellSize',[16 16]);
% imshow(hog16)
hold on;
plot(vis16);