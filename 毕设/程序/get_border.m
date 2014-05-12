function [img] = get_border(img)
%Ô¤´¦Àí

img = edge(img,'sobel');
img = imdilate(img,ones(3));%¼Ó¿í±ßÔµ