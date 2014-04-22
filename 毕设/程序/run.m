clear all;
close all;
clc;

img= imread('rect.bmp');
img= rgb2gray(img);


imshow(img);
dot=ginput();       %取四个点，依次是左上，右上，左下，右下,这里我取的是书的四个角

img = correct_img(img, dot);

figure;
imshow(uint8(img));