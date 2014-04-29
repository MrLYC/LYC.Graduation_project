function [imgn] = get_border(img)
%±ßÔµ¼ì²â

imgn = imfilter(rgb2gray(img), fspecial('sobel'));