function [n] = ShowHc(Hc, p)
%显示圆形的霍夫空间
r1 = [];
r2 = [];
r3 = [];
n = 0;
[a b c] = size(Hc);

for i=1:a
    for j=1:b
        for k=1:c
            if (Hc(i, j, k) >= p)
                r1(end+1) = i;
                r2(end+1) = j;
                r3(end+1) = k;
                n = n + 1;
            end
        end
    end
end

figure('NumberTitle', 'off', 'Name', '圆形的霍夫空间');
scatter3(r1, r2, r3);
end