% Yukun Duan
% CSE5524 - HW3
% 9/10/2022

%% Problem 1
a=0.4;
wx=[0.25-0.5*a,0.25,a,0.25,0.25-0.5*a];
wy=reshape(wx,[5,1]);
img=imread("pic.jpg");
img_gray=rgb2gray(img);
img_filter=double(img_gray);
for i =0:3
    imwrite(img_filter/255, sprintf('gaussian_%d.png',i)); % print out the pic
    GaussianPyramid = blurImage(img_filter, wx, wy);
    estimate = interpolation(GaussianPyramid);
    imwrite((img_filter-estimate)/255, sprintf('laplacian_%d.png',i));
    img_filter = GaussianPyramid;  % evaluate loop
end




%% Problem 2
backgroundIm = double(imread('bg000.bmp'));
inputIm = double(imread('walk.bmp'));
binaryOutput=abs(inputIm-backgroundIm);
T_list=[10 ,20 ,30 ,40 ,50 ,75 ,100 ,125 ,150 ,175 ,200 ,255];
for T = T_list
    binaryOutput1=binaryOutput;
    binaryOutput1(binaryOutput1>T)=1;
    binaryOutput1(binaryOutput1~=1)=0;
    imwrite(binaryOutput1, sprintf('T%d.png',T));
end



%% Problem 3
for i = 1:30
    filename = sprintf('bg%03d.bmp', i-1);
    Im(:,:,i) = double(imread(filename));
end
stdev = std(Im, 0, 3);   % Calculate stdev matrix
avg = mean(Im, 3);     % Calculate mean matrix
BinaryOutput = (inputIm - avg).^2 ./ stdev.^2;
t_list2 = 1:40;
for t = t_list2
    BinaryOutput1=BinaryOutput;
    BinaryOutput1(BinaryOutput1>t^2)=1;
    BinaryOutput1(BinaryOutput1~=1)=0;
    imwrite(BinaryOutput1, sprintf('t%d.png',t));
end

%% Problem 4
bsIm = double(imread('t16.png')); % Based on output, 't16.png' is the best one
d_bsIm = bwmorph(bsIm, 'dilate');
imwrite(d_bsIm, 'dilatedImage.png');



%% Problem 5
[L, num] = bwlabel(d_bsIm, 8);
second_most = mode(L(L ~= 0), 'all');
L(L ~= second_most) = 0;
imshow(L);
imwrite(L, 'Output.png');



%% Problem 1-Blur the image 
function bluredSample= blurImage(image, wx,wy)
    blured = imfilter(imfilter(image, wx, 'replicate'), wy, 'replicate');
    bluredSample = blured(1:2:end, 1:2:end);  % Sample the image to 1/2 size
end

%% Problem 1-Interpolation

function newImage=interpolation(image)
    newImage=zeros(size(image)*2-1);
    newImage(1:2:end,1:2:end)=image;
    row_ave = conv2(image, [1 1], 'valid')/2;
    col_ave = conv2(image, [1;1], 'valid')/2; 
    newImage(1:2:end,2:2:end) = row_ave;
    newImage(2:2:end,1:2:end) = col_ave;
    mid_ave = conv2(row_ave,[1;1], 'valid')/2;
    newImage(2:2:end, 2:2:end) = mid_ave;
end
