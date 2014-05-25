function [n] = ShowHc(Hc, p, min_r)
%��ʾԲ�εĻ���ռ�
r1 = [];
r2 = [];
r3 = [];
n = 0;
[a b c] = size(Hc);

for i=1:a
    for j=1:b
        for k=1:c
            if (Hc(i, j, k) >= p)
                r1(end+1) = j;
                r2(end+1) = i;
                r3(end+1) = k;
                n = n + 1;
            end
        end
    end
end

figure('NumberTitle', 'off', 'Name', 'Բ�εĻ���ռ�');
scatter3(r1, r2, r3+min_r, 'filled');
xlabel('x');
ylabel('y');
zlabel('r');
title(['��ֵ��' num2str(p)]);
end