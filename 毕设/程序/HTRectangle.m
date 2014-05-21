function [H rect] = HTRectangle(img, n)
%ªÙ∑Ú±‰ªªºÏ≤‚æÿ’Û

[rows cols] = size(img);
[H lines] = HTLine(img, n);
rect = {};

lsize = length(lines);
if(lsize == 0)
    return ;
end

p_lines = {};
v_lines = {};

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
        p_lines{end+1} = struct('A',A,'B',B,'C',C);
        p_l = p_l + 1;
    elseif(k > 57.29)
        v_lines{end+1} = struct('A',A,'B',B,'C',C);
        v_l = v_l + 1;
    end    
end

if(p_l < 2 || v_l < 2)
    return ;
end

p_i = combntns([1:p_l], 2);
v_i = combntns([1:v_l], 2);

for i=1:p_l-1
    idx = p_i(i, :);
    p1 = p_lines{idx(1)};
    p2 = p_lines{idx(2)};
    
    for j=1:v_l-1
        idx = v_i(j, :);
        p3 = v_lines{idx(1)};
        p4 = v_lines{idx(2)};

        r = [
            inv([-p1.A -p1.B;-p3.A -p3.B]) * [p1.C p3.C]';
            inv([-p1.A -p1.B;-p4.A -p4.B]) * [p1.C p4.C]';
            inv([-p2.A -p2.B;-p3.A -p3.B]) * [p2.C p3.C]';
            inv([-p2.A -p2.B;-p4.A -p4.B]) * [p2.C p4.C]';
        ];
    
        para = {};
        for k=1:2:length(r)
            a = round(r(k+1));
            b = round(r(k));
            if (a <= 0 || a >= rows || b <= 0 || b >= cols || sum(img(a-2:a+2,b)) < 1 || sum(img(a,b-2:b+2)) < 1)
                para = {};
                break;
            end
            para{end+1} = struct('x',b,'y',a)
        end
        
        if (length(para) == 4)
            rect{end+1} = para;
        end
    end
end

end