function [] = MarkCircle(circ)
%±ê¼ÇÔ²ÐÎ
    [M N] = size(circ);
    for i=1:N
        x = circ(1,i);
        y = circ(2,i);
        r = circ(3,i);
        plot(x,y,'x','LineWidth',2,'Color','b'); 
        plot(x,y,'ko','LineWidth',1,'MarkerSize',r,'Color','y');
    end
end