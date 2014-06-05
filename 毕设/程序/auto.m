clear all;
close all;
clc;
warning off all;
min_r = 130;
max_r = 140;
lnum = 10;
pc = 23;
pr = 200;

dot = [
    103.7651   12.6779;
	498.4982   50.4715;
    7.1815  412.4502;
	427.9502  467.0409;
  ];

img = imread('3.jpg');

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