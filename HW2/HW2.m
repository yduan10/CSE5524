% Yukun Duan
% CSE5524 - HW2
% 8/31/2022

%% Problem 1
sigma=40.0;  % use largest value
G = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);
faceIm = double(imread('affleck_gray.png'));
gIm = imfilter(faceIm, G, 'replicate');
imshow(gIm/255); % double images need range of 0-1
imwrite(uint8(gIm), 'gIm.bmp');
axis("image");
pause;

sigma=20.0;  % second try
G = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);
faceIm = double(imread('affleck_gray.png'));
gIm = imfilter(faceIm, G, 'replicate');
imshow(gIm/255); % double images need range of 0-1
imwrite(uint8(gIm), 'gIm1.bmp');
axis("image");
pause;

sigma=15.0; % third try
G = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);
faceIm = double(imread('affleck_gray.png'));
gIm = imfilter(faceIm, G, 'replicate');
imshow(gIm/255); % double images need range of 0-1
imwrite(uint8(gIm), 'gIm2.bmp');
axis("image");
pause;

sigma=10.0;   %fourth try
G = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);
faceIm = double(imread('affleck_gray.png'));
gIm = imfilter(faceIm, G, 'replicate');
imshow(gIm/255); % double images need range of 0-1
imwrite(uint8(gIm), 'gIm3.bmp');
axis("image");
pause;

sigma=5.0;  % fifth try
G = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);
faceIm = double(imread('affleck_gray.png'));
gIm = imfilter(faceIm, G, 'replicate');
imshow(gIm/255); % double images need range of 0-1
imwrite(uint8(gIm), 'gIm4.bmp');
axis("image");
pause;

sigma=4.0;  % sixth try
G = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);
faceIm = double(imread('affleck_gray.png'));
gIm = imfilter(faceIm, G, 'replicate');
imshow(gIm/255); % double images need range of 0-1
imwrite(uint8(gIm), 'gIm5.bmp');
axis("image");
pause;

sigma=3.0;  % seventh try
G = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);
faceIm = double(imread('affleck_gray.png'));
gIm = imfilter(faceIm, G, 'replicate');
imshow(gIm/255); % double images need range of 0-1
imwrite(uint8(gIm), 'gIm6.bmp');
axis("image");
pause;

sigma=2.0;   % eighth try
G = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);
faceIm = double(imread('affleck_gray.png'));
gIm = imfilter(faceIm, G, 'replicate');
imshow(gIm/255); % double images need range of 0-1
imwrite(uint8(gIm), 'gIm7.bmp');
axis("image");
pause;

sigma=1.0;   % ninth try
G = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);
faceIm = double(imread('affleck_gray.png'));
gIm = imfilter(faceIm, G, 'replicate');
imshow(gIm/255); % double images need range of 0-1
imwrite(uint8(gIm), 'gIm8.bmp');
axis("image");  
pause;

sigma=0.5; % tenth try
G = fspecial('gaussian', 2*ceil(3*sigma)+1, sigma);
faceIm = double(imread('affleck_gray.png'));
gIm = imfilter(faceIm, G, 'replicate');
imshow(gIm/255); % double images need range of 0-1
imwrite(uint8(gIm), 'gIm9.bmp');
axis("image");
pause;

%% Problem 2
[a,b] = gaussDeriv2D(5);  % let sigma value be 5
img_gx = imagesc(a);  % Display image with scaled colors
colormap('gray');
pause;

img_gy = imagesc(b);
colormap('gray');
pause;

%% Problem 3
[Gx,Gy] = gaussDeriv2D(5);  %let sigma value be 5
myIm = double(imread('pic.jpg'));
myim=imread('pic.jpg');
gxIm = imfilter(myIm, Gx, 'replicate');
gyIm = imfilter(myIm, Gy, 'replicate');
magIm = sqrt(gxIm.^2 + gyIm.^2);
imagesc(gxIm);
imagesc(gyIm);
imagesc(magIm);
pause;


%% Problem 4
T = 0.3;  % try T for three different value
tIm = magIm > T;
imagesc(tIm);
pause;

T = 1;
tIm = magIm > T;
imagesc(tIm);
pause;

T = 3;
tIm = magIm > T;
imagesc(tIm);
pause;

T = 10;
tIm = magIm > T;
imagesc(tIm);
pause;

T = 20;
tIm = magIm > T;
imagesc(tIm);
pause;

%% Problem 5
T = 0.3;
Fx = -fspecial('sobel')';
fxIm = imfilter(myIm,Fx);
Fy = -fspecial('sobel');
fyIm = imfilter(myIm,Fy);
magIm = sqrt(fxIm.^2 + fyIm.^2);
tIm = magIm > T;
imagesc(tIm);
pause;

T = 1;
Fx = -fspecial('sobel')';
fxIm = imfilter(myIm,Fx);
Fy = -fspecial('sobel');
fyIm = imfilter(myIm,Fy);
magIm = sqrt(fxIm.^2 + fyIm.^2);
tIm = magIm > T;
imagesc(tIm);
pause;

T = 3;
Fx = -fspecial('sobel')';
fxIm = imfilter(myIm,Fx);
Fy = -fspecial('sobel');
fyIm = imfilter(myIm,Fy);
magIm = sqrt(fxIm.^2 + fyIm.^2);
tIm = magIm > T;
imagesc(tIm);
pause;

T = 10;
Fx = -fspecial('sobel')';
fxIm = imfilter(myIm,Fx);
Fy = -fspecial('sobel');
fyIm = imfilter(myIm,Fy);
magIm = sqrt(fxIm.^2 + fyIm.^2);
tIm = magIm > T;
imagesc(tIm);
pause;

T = 20;
Fx = -fspecial('sobel')';
fxIm = imfilter(myIm,Fx);
Fy = -fspecial('sobel');
fyIm = imfilter(myIm,Fy);
magIm = sqrt(fxIm.^2 + fyIm.^2);
tIm = magIm > T;
imagesc(tIm);
pause;

T = 100;
Fx = -fspecial('sobel')';
fxIm = imfilter(myIm,Fx);
Fy = -fspecial('sobel');
fyIm = imfilter(myIm,Fy);
magIm = sqrt(fxIm.^2 + fyIm.^2);
tIm = magIm > T;
imagesc(tIm);
pause;

%% Problem 6
Im = rgb2gray(myim);
edge(Im,'canny');

%% Problem 2 Function
function [Gx, Gy] = gaussDeriv2D(sigma)
    MaskSize = 2 * ceil(sigma * 3) + 1;
    for r = 1:MaskSize
        for c = 1:MaskSize
            x = c-ceil(3*sigma)-1;
            y = r-ceil(3*sigma)-1;
            Gx(r,c) = x * exp(-1 * (x^2 + y^2)/(2 * sigma^2)) / (2 * pi * sigma^4);
            Gy(r,c) = y * exp(-1 * (x^2 + y^2)/(2 * sigma^2)) / (2 * pi * sigma^4);
        end
    end
end

