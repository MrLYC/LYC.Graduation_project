function [img] = get_border(img)
%Ô¤´¦Àí

img = edge(img,'canny');
img = imdilate(img,ones(3));%¼Ó¿í±ßÔµ