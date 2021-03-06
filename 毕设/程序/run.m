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
disp(['目标图片：' path]);
disp(' ');

min_r = input('圆形半径搜索下限：');
if isequal(min_r, [])
    return;
end

max_r = input('圆形半径搜索上限：');
if isequal(min_r, [])
    return;
end

lnum = input('待检测直线数目：');
if isequal(min_r, [])
    return;
end

pc = input('待检测圆形阈值：');
if isequal(min_r, [])
    return;
end

pr = input('待检测矩形阈值：');
if isequal(min_r, [])
    return;
end

figure('NumberTitle', 'off', 'Name', '请选择顶点');
imshow(img);
title('取左上，右上，左下，右下四个点');
axis on;
dot=ginput(4);
close;
drawnow;

if length(dot) < 4
    return;
end

disp(' ');
disp('正在进行预处理...');
figure('NumberTitle', 'off', 'Name', '预处理');
imshow(img);
drawnow;
hold on;
pause(1);
img = preprocessing(img);
imshow(img);
drawnow;
hold off;
pause(1);

disp('正在进行透视变换...');
img = correct_img(img, dot);
figure('NumberTitle', 'off', 'Name', '透视变换');
imshow(img,[]);
drawnow;
pause(1);

disp('正在进行提取边缘...');
img = get_border(img, 3);
figure('NumberTitle', 'off', 'Name', '提取边缘');
imshow(img);
drawnow;
pause(1);

figure('NumberTitle', 'off', 'Name', '检测结果');
imshow(img);
axis on;
drawnow;
hold on;
pause(1);

disp(' ');
disp('正在进行霍夫变换检测矩形...');
[Hr rect] = HTRectangle(img, lnum);
disp('检测矩形结果：');
MarkRectangle(rect);
disp(' ');
drawnow;
pause(1);

disp('正在进行霍夫变换检测圆形...');
[Hc circ] = HTCircle(img, 0.5, min_r, max_r, pc);
disp('检测圆形结果：');
MarkCircle(circ);
disp(' ');
drawnow;
pause(1);

hold off;

disp('正在进行描绘参数空间...');
ShowHr(Hr,pr);
drawnow;
pause(1);
ShowHc(Hc,pc, min_r);
drawnow;
pause(1);

warning on all;

disp(' ');
disp('处理完毕');