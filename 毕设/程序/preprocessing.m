function [imgn] = preprocessing(img)
%Ô¤´¦Àí

imgn = rgb2gray(img);
imgn = imadjust(imgn);