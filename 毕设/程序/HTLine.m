function [line] = HTLine(img, dt)
%����任���ֱ��

[rows, cols] = size(img);
d = round(sqrt(rows^2 + cols^2));
leng = 2*d;
acc = zeros(180, leng);
pot = cell(180, leng);

for x=1:rows
    for y=1:cols
        if (img(x,y,1) > 250 && img(x,y,2) > 250 && img(x,y,3) > 250) %ֻ�����ɫ��
            for t=1:180 %��0�ȵ�180��ÿ���Ƕȱ���һ��
                p = round(x*cos(pi*t/180) + y*sin(pi*t/180));
                
                k = p;
                if (k > 0)
                    k = k + d;
                else
                    k = 1 - k;
                end
                
                acc(t, k) = acc(t, k) + 1;
                pot{t, k} = [pot{t, k}, [x, y]'];
                
            end
        end
    end
end

for t=1:180
    for k=1:leng
        a = acc(t, k);
        if (a > dt)
            p = pot{t, k};
            for i=1:a
                img(p(1, i), p(2, i), 1)=255;
                img(p(1, i), p(2, i), 2)=0;
                img(p(1, i), p(2, i), 3)=0;
            end
        end
    end
end
end
