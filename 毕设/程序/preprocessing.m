function [imgn] = preprocessing(img)
%Ԥ����

img = imcomplement(img);
imgn = rgb2gray(img);