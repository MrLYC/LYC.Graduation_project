function [H lines] = HTLine(f, n)
%ªÙ∑Ú±‰ªªºÏ≤‚÷±œﬂ

[H, theta, rho] = hough(f); 
peaks = houghpeaks(H, n);
lines = houghlines(f, theta, rho, peaks) ;

end
