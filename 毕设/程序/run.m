clear all;
close all;
clc;

img = imread('3.jpg');

figure('NumberTitle', 'off', 'Name', '��ѡ�񶥵�');
imshow(img);
dot=ginput();       %ȡ�ĸ��㣬���������ϣ����ϣ����£�����,������ȡ��������ĸ���

if length(dot) >= 4
    img = preprocessing(img);
    img = correct_img(img, dot);
    img = get_border(img, 3);

    figure('NumberTitle', 'off', 'Name', '�����');
    [Hc circ] = HTCircle(img,1,0.5,130,140,25);
    [Hr rect] = HTRectangle(img, 10);
    
    imshow(img);
    hold on;
    
    MarkCircle(circ);
    MarkRectangle(rect);
    
    hold off;
    
    ShowHc(Hc,20);
    ShowHr(Hr,100);
end