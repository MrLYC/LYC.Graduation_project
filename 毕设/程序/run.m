clear all;
close all;
clc;

img= imread('rect.bmp');
img= rgb2gray(img);

img = correct_img(img);

figure;
imshow(uint8(img));