function [imgn] = get_border(img)
%��Ե���

imgn = imfilter(rgb2gray(img), fspecial('sobel'));