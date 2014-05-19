close all
clc
path=fullfile('image processing','shape');
files=dir(fullfile(path,'*.jpg'));
count=length(files);
figure
hold on
for i=1:count
    % find boundary
    bw=im2bw(imread(fullfile(path,files(i).name)));
    boundaries=bwboundaries(bw,'noholes');
    [result,theta,rho]=shapeDetector(boundaries{1});
    
    % plot
    subplot(3,count,i),imshow(bw),title('原始图像')
    subplot(3,count,count+i)
    plot(theta,rho)
    axis([min(theta) max(theta) 0 1])
    title('\theta - \rho关系图')
    subplot(3,count,2*count+i),imshow(bw),title(result)
end