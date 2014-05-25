function [H circ] = HTCircle(img, step_angle, min_r, max_r, p)
%»ô·ò±ä»»¼ì²âÔ²
[rows cols] = size(img);
size_r = round(max_r-min_r)+1;
size_angle = round(2*pi/step_angle);
H = zeros(rows, cols, size_r);

max_p = 0;
for x=1:rows
    for y=1:cols
        if (img(x, y) == 0)
            continue;
        end
        for k=1:step_angle:size_angle
            ck = cos(k);
            sk = sin(k);
            for r=1:size_r
                rt = (min_r+(r-1));
                a = round(x-rt*ck);
                b = round(y-rt*sk);
                if(a>0 && a<=rows && b>0 && b<=cols)
                    val = H(a, b, r)+1;
                    H(a, b, r) = val;
                    if(val > max_p)
                        max_p = val;
                    end
                end
            end
    	end
    end
end

circ = {};
if (max_p < p)
    return;
end

index = find(H>=p);
length = size(index);
div_mn = rows*cols;
for k=1:length
    ik = index(k);
    sq = floor(ik/div_mn);
    md = ik-sq*div_mn;
    x0 = floor(md/rows);
    y0 = md-x0*rows;
    r0 = min_r+sq;
    
    circ{end+1} = struct('x0', x0+1, 'y0', y0, 'r', r0);
end