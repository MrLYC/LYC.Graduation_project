clear all;
close all;
clc;
warning off all;

[filename pathname idx] = uigetfile('*.jpg;*.tif;*.png;*.bmp','Select image files');

if isequal(filename,0)
    return;
end

path = fullfile(pathname, filename);

img = imread(path);
disp(['Ŀ��ͼƬ��' path]);
disp(' ');

min_r = input('Բ�ΰ뾶�������ޣ�');
if isequal(min_r, [])
    return;
end

max_r = input('Բ�ΰ뾶�������ޣ�');
if isequal(min_r, [])
    return;
end

lnum = input('�����ֱ����Ŀ��');
if isequal(min_r, [])
    return;
end

pc = input('�����Բ����ֵ��');
if isequal(min_r, [])
    return;
end

pr = input('����������ֵ��');
if isequal(min_r, [])
    return;
end

figure('NumberTitle', 'off', 'Name', '��ѡ�񶥵�');
imshow(img);
title('ȡ���ϣ����ϣ����£������ĸ���');
dot=ginput(4);       %ȡ�ĸ��㣬���������ϣ����ϣ����£�����
close;
drawnow;

if length(dot) < 4
    return;
end

disp(' ');
disp('���ڽ���Ԥ����...');
img = preprocessing(img);

disp('���ڽ���͸�ӱ任...');
img = correct_img(img, dot);

disp('���ڽ�����ȡ��Ե...');
img = get_border(img, 3);

figure('NumberTitle', 'off', 'Name', '�����');
imshow(img);
drawnow;
hold on;

disp(' ');
disp('���ڽ��л���任������...');
[Hr rect] = HTRectangle(img, lnum);
disp('�����ν����');
MarkRectangle(rect);
disp(' ');

disp('���ڽ��л���任���Բ��...');
[Hc circ] = HTCircle(img, 0.5, min_r, max_r, pc);
disp('���Բ�ν����');
MarkCircle(circ);
disp(' ');

hold off;

disp('���ڽ����������ռ�...');
ShowHr(Hr,pr);
ShowHc(Hc,pc, min_r);

warning on all;

disp(' ');
disp('�������');