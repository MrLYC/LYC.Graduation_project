clear all;
close all;
clc;

[filename pathname idx] = uigetfile('*.jpg;*.tif;*.png;*.bmp','Select image files');

if isequal(filename,0)
    return;
end

path = fullfile(pathname, filename)

img = imread(path);

min_r = input('Բ�ΰ뾶�������ޣ�');
max_r = input('Բ�ΰ뾶�������ޣ�');

lnum = input('�����ֱ����Ŀ��');

pc = input('�����Բ����ֵ��');
pr = input('����������ֵ��');

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