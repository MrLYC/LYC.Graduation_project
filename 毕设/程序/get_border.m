function [img] = get_border(img)
%Ԥ����

img = edge(img,'canny');
img = imdilate(img,ones(3));%�ӿ��Ե