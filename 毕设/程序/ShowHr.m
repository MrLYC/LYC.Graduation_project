function [n] = ShowHr(Hr, p)
%显示直线的霍夫空间
n = 0;
[a b] = size(Hr);
Mk = zeros(a,b);

for i=1:a
    for j=1:b
        if (Hr(i, j) >= p)
            Mk(i, j) = Hr(i, j);
            n = n + 1;
        end
    end
end

figure('NumberTitle', 'off', 'Name', '直线的霍夫空间');
meshz(Mk);
xlabel('θ');
ylabel('ρ');
zlabel('val');
title(['阈值：' num2str(p)]);
end