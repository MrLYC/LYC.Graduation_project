function [] = MarkCircle(circ)
%±ê¼ÇÔ²ÐÎ
    M = length(circ);
    for i=1:M
        c = circ{i};
        plot(c.x0,c.y0,'x','LineWidth',2,'Color','b'); 
        alpha=0:pi/50:2*pi;
        
        x=c.r*cos(alpha) + c.x0; 
        y=c.r*sin(alpha) + c.y0; 
        plot(x,y,'LineWidth',2,'Color','c');
    end
end