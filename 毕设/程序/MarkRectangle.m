function [] = MarkRectangle(rect)
%±ê¼Ç¾ØÐÎ
    L = length(rect);
    
    for i=1:L
        r = rect{i};
        M = length(r);
        
        para = ['Rectangle{' num2str(i) '}: '];
        for k=1:M
            p = r{k};
            
            plot(p.x,p.y,'x','LineWidth',4,'Color','r'); 
            para = [para '(x' num2str(k) '=' num2str(p.x) ', y' num2str(k) '=' num2str(p.y) ') '];
        end
        
        disp(para);
    end
end