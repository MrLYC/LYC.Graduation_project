function [H lines] = HTLine(f, n)
%����任���ֱ��

[H, theta, rho] = hough(f); 
peaks = houghpeaks(H, n);
lines = houghlines(f, theta, rho, peaks) ;

end
