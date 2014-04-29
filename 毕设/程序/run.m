clear all;
close all;
clc;

img = imread('rect.bmp');

imshow(img);
dot=ginput();       %ȡ�ĸ��㣬���������ϣ����ϣ����£�����,������ȡ��������ĸ���

if length(dot) >= 4
    img = get_border(img);
    img = correct_img(img, dot);

    figure;
    imshow(uint8(img));
end