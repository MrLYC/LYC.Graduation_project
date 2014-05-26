clear all;
close all;
clc;

[filename pathname idx] = uigetfile('*.jpg;*.tif;*.png;*.bmp','Select image files');

if isequal(filename,0)
    return;
end

path = fullfile(pathname, filename)

img = imread(path);

min_r = input('圆形半径搜索下限：');
max_r = input('圆形半径搜索上限：');

lnum = input('待检测直线数目：');

pc = input('待检测圆形阈值：');
pr = input('待检测矩形阈值：');

figure('NumberTitle', 'off', 'Name', '请选择顶点');
imshow(img);
title('取左上，右上，左下，右下四个点');
dot=ginput();       %取四个点，依次是左上，右上，左下，右下
close;

if length(dot) < 4
    return;
end

img = preprocessing(img);
img = correct_img(img, dot);
img = get_border(img, 3);

figure('NumberTitle', 'off', 'Name', '检测结果');
imshow(img);
drawnow;
hold on;

[Hc circ] = HTCircle(img, 0.5, min_r, max_r, pc);
[Hr rect] = HTRectangle(img, lnum);

MarkCircle(circ);
MarkRectangle(rect);

hold off;

ShowHc(Hc,pc, min_r);
ShowHr(Hr,pr);