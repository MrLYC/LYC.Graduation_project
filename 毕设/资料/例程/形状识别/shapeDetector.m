function [ result,theta,rho,peak_num ] = shapeDetector( boundary )
%SHAPEDETECTOR Detect shapes, eg: Circle, Rectangle, Triangle
%   author: heawjc
%   2013.3.10
boundaryx=boundary(:,2);
boundaryy=boundary(:,1);
centroid=[(max(boundaryx)+min(boundaryx))/2 (max(boundaryy)+min(boundaryy))/2];
boundaryx=boundaryx-centroid(1);
boundaryy=boundaryy-centroid(2);

% x - y => theta - rho
[theta,rho]=cart2pol(boundaryx,boundaryy);
r=sortrows([theta*180/pi rho]);
[~,idx]=min(r(:,2));
if idx>1
    r=[r(idx:end,:);r(1:idx-1,1)+360 r(1:idx-1,2)];
end
theta=r(:,1);
rho=r(:,2)/max(rho);

% check which shape
if min(rho)>.7
    result='Circle';
    peak_num=0;
else
    % find peak numbers
    peak_num=length(findpeaks(r(round(linspace(1,length(theta),min([length(theta) 32]))),2)));
    switch peak_num
        case 3
            result='Triangle';
        case 4
            result='Rectangle';
        otherwise
            result='Unknown Shape';
    end
end
end