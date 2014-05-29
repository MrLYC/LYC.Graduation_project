function [] = MarkRectangle(rect)
%±ê¼Ç¾ØÐÎ
    L = length(rect);
    
    for i=1:L
        r = rect{i};
        M = length(r);
        
        para = ['Rectangle{' num2str(i) '}: '];
        X = [];
        Y = [];
        for k=1:M
            p = r{k};
            X = [X p.x];
            Y = [Y p.y];
            
            plot(p.x,p.y,'x','LineWidth',4,'Color','r'); 
            para = [para '(x' num2str(k) '=' num2str(p.x) ', y' num2str(k) '=' num2str(p.y) ') '];
        end
        x = min(X);
        y = min(Y);
        w = max(X) - x;
        h = max(Y) - y;
        rectangle('position',[x, y, w, h], 'LineWidth', 2, 'edgecolor','g');
        
        disp(para);
    end
end