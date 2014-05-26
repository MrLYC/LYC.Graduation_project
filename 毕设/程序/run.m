clear all;
close all;
clc;

[FileName,PathName,FilterIndex] = uigetfile('*.jpg;*.tif;*.png;*.bmp','All Image Files''*.*','All Files');
img = imread(FileName);

figure('NumberTitle', 'off', 'Name', '请选择顶点');
imshow(img);
title('取左上，右上，左下，右下四个点');
dot=ginput();       %取四个点，依次是左上，右上，左下，右下
close;

if length(dot) >= 4
    img = preprocessing(img);
    img = correct_img(img, dot);
    img = get_border(img, 3);

    figure('NumberTitle', 'off', 'Name', '检测结果');
    [Hc circ] = HTCircle(img, 0.5, 130, 140, 25);
    [Hr rect] = HTRectangle(img, 10);
    
    imshow(img);
    hold on;
    
    MarkCircle(circ);
    MarkRectangle(rect);
    
    hold off;
    
    ShowHc(Hc,20, 130);
    ShowHr(Hr,200);
end