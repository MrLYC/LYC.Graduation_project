function [img] = get_border(img, size)
%Ԥ����

img = edge(img,'sobel');
img = imdilate(img,ones(size));%�ӿ��Ե