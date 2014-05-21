function [para] = HTCircle(BW,step_r,step_angle,r_min,r_max,p);
%[HOUGH_SPACE,HOUGH_CIRCLE,PARA] = HOUGH_CIRCLE(BW,STEP_R,STEP_ANGLE,R_MAX,P)
%------------------------------算法概述-----------------------------
% 该算法通过a = x-r*cos(angle)，b = y-r*sin(angle)将圆图像中的边缘?
% 映射到参数空间(a,b,r)中，由于是数字图像且采取极坐标，angle和r都取
% 一定的范围和步长，这样通过两重循环（angle循环和r循环）即可将原图像
% 空间的点映射到参数空间中，再在参数空间（即一个由许多小立方体组成?
% 大立方体)中寻找圆心，然后求出半径坐标。
%-------------------------------------------------------------------
%------------------------------输入参数-----------------------------
% BW:二值图像；
% step_r:检测的圆半径步长
% step_angle:角度步长，单位为弧度
% r_min:最小圆半径
% r_max:最大圆半径
% p:以p*hough_space的最大值为阈值，p取0，1之间的数
%-------------------------------------------------------------------
%------------------------------输出参数-----------------------------
% hough_space:参数空间，h(a,b,r)表示圆心在(a,b)半径为r的圆上的点数
% hough_circl:二值图像，检测到的圆
% para:检测到的圆的圆心、半径
%-------------------------------------------------------------------
% From Internet,Modified by mhjerry,2011-12-11
[m,n] = size(BW);
size_r = round((r_max-r_min)/step_r)+1;
size_angle = round(2*pi/step_angle);
hough_space = zeros(m,n,size_r);
% Hough变换
% 将图像空间(x,y)对应到参数空间(a,b,r)
% a = x-r*cos(angle)
% b = y-r*sin(angle)
max_para = 0;
for x=1:m
    for y=1:n
        if (BW(x,y) == 0)
            continue;
        end
        for k=1:step_angle:size_angle
            ck = cos(k);
            sk = sin(k);
            for r=1:size_r
                rt = (r_min+(r-1)*step_r);
                a = round(x-rt*ck);
                b = round(y-rt*sk);
                if(a>0 && a<=m && b>0 && b<=n)
                    val = hough_space(a,b,r)+1;
                    hough_space(a,b,r) = val;
                    if(val > max_para)
                        max_para = val;
                    end
                end
            end
    	end
    end
end

para = [];
if (max_para < p)
    return;
end

% 搜索超过阈值的聚集
index = find(hough_space>=p);
length = size(index);
div_mn = m*n;
for k=1:length
    ik = index(k);
    sq = floor(ik/div_mn);
    md = sq*div_mn;
    par2 = round((ik-md)/m);
    par1 = ik-md-par2*m;
    par3 = r_min+sq*step_r;
    
    para(:,k) = [par2+1,par1,par3]';
end