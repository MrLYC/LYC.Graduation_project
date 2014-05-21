function [] = MarkCircle(circ)
%±ê¼ÇÔ²ÐÎ
    M = length(circ);
    for i=1:M
        c = circ{i};
        plot(c.x0,c.y0,'x','LineWidth',2,'Color','b'); 
        plot(c.x0,c.y0,'ko','LineWidth',1,'MarkerSize',c.r,'Color','y');
    end
end