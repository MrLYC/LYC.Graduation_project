
img = imread('3.jpg');

imshow(img);
dot=ginput();       %取四个点，依次是左上，右上，左下，右下,这里我取的是书的四个角

if length(dot) >= 4
    img = preprocessing(img);
    img = correct_img(img, dot);
    img = get_border(img, 2);

    figure;
    circ = HTCircle(img,10,0.5,94,188,0.7);
    rect = HTRectangle(img, 10);
    
    imshow(img);
end