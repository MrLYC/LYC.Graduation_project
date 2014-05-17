function [rect] = HTRectangle(img, n)
%ªÙ∑Ú±‰ªªºÏ≤‚æÿ’Û

[rows cols] = size(img);
lines = HTLine(img, n);
rect = [];

lsize = length(lines);
if(lsize == 0)
    return ;
end

p_lines = [];
v_lines = [];

p_l = 0;
v_l = 0;

for i=1:lsize
    l = lines(i);
    x1 = l.point1(1);
    y1 = l.point1(2);
    x2 = l.point2(1);
    y2 = l.point2(2);
    
    A = y2-y1;
    B = x1-x2;
    C = -y1*B-x1*A;
    
    k = abs(A/B);
    if (k < 0.02)
        p_lines(:, end+1) = [A, B, C, sqrt(A*A+B*B)];
        p_l = p_l + 1;
    elseif(k > 57.29)
        v_lines(:, end+1) = [A, B, C, sqrt(A*A+B*B)];
        v_l = v_l + 1;
    end    
end

if(p_l < 2 || v_l < 2)
    return ;
end

p_i = combntns([1:p_l], 2);
v_i = combntns([1:v_l], 2);

rect = [];

for i=1:p_l-1
    idx = p_i(i, :);
    p1 = p_lines(1:3, idx(1));
    p2 = p_lines(1:3, idx(2));
    
    for j=1:v_l-1
        idx = v_i(j, :);
        p3 = v_lines(1:3, idx(1));
        p4 = v_lines(1:3, idx(2));
        
        r = [
            inv([-p1(1) -p1(2);-p4(1) -p4(2)]) * [p1(3) p4(3)]'
            inv([-p1(1) -p1(2);-p3(1) -p3(2)]) * [p1(3) p3(3)]'
            inv([-p2(1) -p2(2);-p4(1) -p4(2)]) * [p2(3) p4(3)]'
            inv([-p2(1) -p2(2);-p3(1) -p3(2)]) * [p2(3) p3(3)]'
        ];
    
        flag = true;
        for k=1:2:length(r)
            a = round(r(k));
            b = round(r(k+1));
            if (a <= 0 || a >= rows || b <= 0 || b >= cols)
                flag = false;
                break;
            end
        end
        
        if (flag)
            rect(:, end+1) = r;
        end
    end
end

end