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
disp('���ڽ���Ԥ����...');
figure('NumberTitle', 'off', 'Name', 'Ԥ����');
imshow(img);
drawnow;
hold on;
pause(1);
img = preprocessing(img);
imshow(img);
drawnow;
hold off;
pause(1);

disp('���ڽ���͸�ӱ任...');
img = correct_img(img, dot);
figure('NumberTitle', 'off', 'Name', '͸�ӱ任');
imshow(img,[]);
drawnow;
pause(1);

disp('���ڽ�����ȡ��Ե...');
img = get_border(img, 3);
figure('NumberTitle', 'off', 'Name', '��ȡ��Ե');
imshow(img);
drawnow;
pause(1);

figure('NumberTitle', 'off', 'Name', '�����');
imshow(img);
axis on;
drawnow;
hold on;
pause(1);

disp(' ');
disp('���ڽ��л���任������...');
[Hr rect] = HTRectangle(img, lnum);
disp('�����ν����');
MarkRectangle(rect);
disp(' ');
drawnow;
pause(1);

disp('���ڽ��л���任���Բ��...');
[Hc circ] = HTCircle(img, 0.5, min_r, max_r, pc);
disp('���Բ�ν����');
MarkCircle(circ);
disp(' ');
drawnow;
pause(1);

hold off;

disp('���ڽ����������ռ�...');
ShowHr(Hr,pr);
drawnow;
pause(1);
ShowHc(Hc,pc, min_r);
drawnow;
pause(1);

warning on all;

disp(' ');
disp('�������');