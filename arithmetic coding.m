%arithmetic coding
img = imread("image6.jpeg");
img = rgb2gray(img);
[r,c] = size(img);
d = img(:);
input = double(d);
[alpha, ~, seq] = unique(input);
counts = histc(input, alpha);
code = arithenco(seq, counts);
