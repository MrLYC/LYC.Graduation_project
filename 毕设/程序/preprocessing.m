function [imgn] = preprocessing(img)
%Ԥ����

imgn = rgb2gray(img);
imgn = imadjust(imgn);