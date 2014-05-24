function [] = MarkCircle(circ)
%±ê¼ÇÔ²ÐÎ
    M = length(circ);
    for i=1:M
        c = circ{i};
        plot(c.x0,c.y0,'x','LineWidth',2,'Color','b'); 
        plot(c.x0,c.y0,'ko','LineWidth',2,'MarkerSize',c.r,'Color','c');
    end
end