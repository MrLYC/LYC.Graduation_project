function [para] = HTCircle(BW,step_r,step_angle,r_min,r_max,p);
%[HOUGH_SPACE,HOUGH_CIRCLE,PARA] = HOUGH_CIRCLE(BW,STEP_R,STEP_ANGLE,R_MAX,P)
%------------------------------�㷨����-----------------------------
% ���㷨ͨ��a = x-r*cos(angle)��b = y-r*sin(angle)��Բͼ���еı�Ե?
% ӳ�䵽�����ռ�(a,b,r)�У�����������ͼ���Ҳ�ȡ�����꣬angle��r��ȡ
% һ���ķ�Χ�Ͳ���������ͨ������ѭ����angleѭ����rѭ�������ɽ�ԭͼ��
% �ռ�ĵ�ӳ�䵽�����ռ��У����ڲ����ռ䣨��һ�������С���������?
% ��������)��Ѱ��Բ�ģ�Ȼ������뾶���ꡣ
%-------------------------------------------------------------------
%------------------------------�������-----------------------------
% BW:��ֵͼ��
% step_r:����Բ�뾶����
% step_angle:�ǶȲ�������λΪ����
% r_min:��СԲ�뾶
% r_max:���Բ�뾶
% p:��p*hough_space�����ֵΪ��ֵ��pȡ0��1֮�����
%-------------------------------------------------------------------
%------------------------------�������-----------------------------
% hough_space:�����ռ䣬h(a,b,r)��ʾԲ����(a,b)�뾶Ϊr��Բ�ϵĵ���
% hough_circl:��ֵͼ�񣬼�⵽��Բ
% para:��⵽��Բ��Բ�ġ��뾶
%-------------------------------------------------------------------
% From Internet,Modified by mhjerry,2011-12-11
[m,n] = size(BW);
size_r = round((r_max-r_min)/step_r)+1;
size_angle = round(2*pi/step_angle);
hough_space = zeros(m,n,size_r);
% Hough�任
% ��ͼ��ռ�(x,y)��Ӧ�������ռ�(a,b,r)
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

% ����������ֵ�ľۼ�
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