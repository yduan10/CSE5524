% Yukun Duan
% CSE5524 - HW1
% 8/25/2022

%% Problem 1
 
grayIm = imread('buckeyes_gray.bmp'); %read the image from the file 
imagesc(grayIm); %display the data in bmp 
axis('image');
colormap('gray');
imwrite(grayIm, 'buckeyes_gray.jpg'); %write gray image to jpg file

%% 

rgbIm = imread('buckeyes_rgb.bmp'); %read the image from the file 
imagesc(rgbIm);
axis('image');
imwrite(rgbIm, 'buckeyes_rgb.jpg'); %write rgb image to jpg file


%% Problem 2

grayIm = rgb2gray(rgbIm); %convert RGB images to grayscale
imshow(grayIm); %display image




%% Problem 3

zBlock = zeros(10,10);
oBlock = ones(10,10)*255;
pattern = [zBlock oBlock; oBlock zBlock];
checkerIm = repmat(pattern, 5, 5); %generate a 25 set 10-by-10 array
imwrite(uint8(checkerIm), 'checkerIm.bmp'); %generate bmp image file
Im = imread('checkerIm.bmp');
imagesc(Im)
colormap('gray') %convert image to grayscale
axis('image');
