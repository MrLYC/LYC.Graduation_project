function [] = MarkRectangle(rect)
%±ê¼Ç¾ØÐÎ
    [M N] = size(rect);
    
    for i=1:N
        for k=1:2:M
            x = rect(k, i);
            y = rect(k+1, i);
            
            plot(x,y,'x','LineWidth',4,'Color','r'); 
        end
    end
end