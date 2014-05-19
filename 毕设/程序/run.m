
img = imread('3.jpg');

imshow(img);
dot=ginput();       %ȡ�ĸ��㣬���������ϣ����ϣ����£�����,������ȡ��������ĸ���

if length(dot) >= 4
    img = preprocessing(img);
    img = correct_img(img, dot);
    img = get_border(img, 2);

    figure;
    circ = HTCircle(img,10,0.5,94,188,0.7);
    rect = HTRectangle(img, 10);
    
    imshow(img);
end