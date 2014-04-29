clear all;
close all;
clc;

img = imread('rect.bmp');

imshow(img);
dot=ginput();       %取四个点，依次是左上，右上，左下，右下,这里我取的是书的四个角

if length(dot) >= 4
    img = get_border(img);
    img = correct_img(img, dot);

    figure;
    imshow(uint8(img));
end