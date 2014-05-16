function [img] = get_border(img, size)
%Ô¤´¦Àí

img = edge(img,'sobel');
img = imdilate(img,ones(size));%¼Ó¿í±ßÔµ