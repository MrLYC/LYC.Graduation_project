clear all;
close all;
clc;

img = imread('rect.jpg');

imshow(img);
dot=ginput();       %ȡ�ĸ��㣬���������ϣ����ϣ����£�����,������ȡ��������ĸ���

if length(dot) >= 4
    img = preprocessing(img);
    img = correct_img(img, dot);
    img = get_border(img);

    figure;
    imshow(img);
    hold on;
    lines = HTLine(img, 4);
    for k = 1:length(lines) 

    xy = [lines(k).point1 ; lines(k).point2]; 

    plot(xy(:,1), xy(:,2), 'LineWidth', 4, 'Color', [.8 .0 .0]); 

    end 
end