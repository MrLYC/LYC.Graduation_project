clear all;
close all;
clc;

img= imread('rect.bmp');
img= rgb2gray(img);


imshow(img);
dot=ginput();       %ȡ�ĸ��㣬���������ϣ����ϣ����£�����,������ȡ��������ĸ���

img = correct_img(img, dot);

figure;
imshow(uint8(img));