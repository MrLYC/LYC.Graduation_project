function [n] = ShowHr(Hr, p)
%��ʾֱ�ߵĻ���ռ�
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

figure('NumberTitle', 'off', 'Name', 'ֱ�ߵĻ���ռ�');
meshz(Mk);
xlabel('��');
ylabel('��');
zlabel('val');
title(['��ֵ��' num2str(p)]);
end