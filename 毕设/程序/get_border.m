function [img] = get_border(img)
%Ԥ����

img = edge(img,'sobel');
img = imdilate(img,ones(3));%�ӿ��Ե