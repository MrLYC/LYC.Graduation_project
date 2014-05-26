clear all;
close all;
clc;

[filename pathname idx] = uigetfile('*.jpg;*.tif;*.png;*.bmp','Select image files');

if isequal(filename,0)
    return;
end

path = fullfile(pathname, filename)

img = imread(path);

figure('NumberTitle', 'off', 'Name', '��ѡ�񶥵�');
imshow(img);
title('ȡ���ϣ����ϣ����£������ĸ���');
dot=ginput();       %ȡ�ĸ��㣬���������ϣ����ϣ����£�����
close;

if length(dot) < 4
    return;
end

img = preprocessing(img);
img = correct_img(img, dot);
img = get_border(img, 3);

figure('NumberTitle', 'off', 'Name', '�����');
[Hc circ] = HTCircle(img, 0.5, 130, 140, 25);
[Hr rect] = HTRectangle(img, 10);

imshow(img);
hold on;

MarkCircle(circ);
MarkRectangle(rect);

hold off;

ShowHc(Hc,20, 130);
ShowHr(Hr,200);