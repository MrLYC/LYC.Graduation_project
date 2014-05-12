function [imgn] = preprocessing(img)
%Ô¤´¦Àí

img = imcomplement(img);
imgn = rgb2gray(img);