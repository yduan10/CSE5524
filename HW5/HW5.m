



%% Problem 2
mhi = zeros([320 240]);

for i = 2:22
    im = imread(sprintf('T4-%d.png',i));
    mhi(im > 0) = i;
end




% normalize mhi between 0 - 1
mhi = max(0, (mhi - 1)/21);
imagesc(mhi)
colormap('gray')

imwrite(mhi, 'MHI.png')






