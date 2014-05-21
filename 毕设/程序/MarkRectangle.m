function [] = MarkRectangle(rect)
%±ê¼Ç¾ØÐÎ
    L = length(rect);
    
    for i=1:L
        r = rect{i};
        M = length(r);
        for k=1:M
            p = r{k};
            plot(p.x,p.y,'x','LineWidth',4,'Color','r'); 
        end
    end
end