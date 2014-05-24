clear all;
close all;
clc;

img = imread('3.jpg');

imshow(img);
dot=ginput();       %取四个点，依次是左上，右上，左下，右下,这里我取的是书的四个角

if length(dot) >= 4
    img = preprocessing(img);
    img = correct_img(img, dot);
    img = get_border(img, 3);

    figure;
    [Hc circ] = HTCircle(img,1,0.5,130,140,25);
    [Hr rect] = HTRectangle(img, 10);
    
    imshow(img);
    hold on;
    
    MarkCircle(circ);
    MarkRectangle(rect);
end