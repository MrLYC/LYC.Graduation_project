function [] = MarkCircle(circ)
%±ê¼ÇÔ²ÐÎ
    M = length(circ);
    for i=1:M
        c = circ{i};
        alpha=0:pi/50:2*pi;
        x=c.r*cos(alpha) + c.x0; 
        y=c.r*sin(alpha) + c.y0; 
        
        disp(['Clircle{' num2str(i) '}: x0=' num2str(c.x0) ', y0=' num2str(c.y0) ', r0=' num2str(c.r)]);
        plot(c.x0,c.y0,'x','LineWidth',2,'Color','b'); 
        plot(x,y,'LineWidth',2,'Color','c');
    end
end