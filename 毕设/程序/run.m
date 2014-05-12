clear all;
close all;
clc;

img = imread('rect.jpg');

imshow(img);
dot=ginput();       %取四个点，依次是左上，右上，左下，右下,这里我取的是书的四个角

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