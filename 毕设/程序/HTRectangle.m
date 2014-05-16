function [rect] = HTRectangle(f, n)
%ªÙ∑Ú±‰ªªºÏ≤‚æÿ’Û

lines = HTLine(f, n);
rect = [];
idx = 1;

size = length(lines);
for i=1:size
    la = lines(i);
    for j=1:size
        if(i == j)
            continue;
        end
        
        lb = lines(j);
        
        theta = abs(la.theta - lb.theta);
        if(cos(theta) < 0.05)
            x1 = la.point1(1);
            y1 = la.point1(2);
            x2 = la.point2(1);
            y2 = la.point2(2);
            x3 = lb.point1(1);
            y3 = lb.point1(2);
            x4 = lb.point2(1);
            y4 = lb.point2(2);
            
            A1 = y2-y1;
            B1 = x1-x2;
            A2 = y4-y3;
            B2 = x3-x4;
            C1 = y1*B1-x1*A1;
            C2 = y3*B2-x3*A2;
            
            Rs = inv([A1 B1;A2 B2]) * [C1 C2]';
            rect{idx} = Rs';
            idx = idx + 1;
        end
    end
end
end