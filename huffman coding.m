clc
clear all 
%huffman coding
image = imread("image6.jpeg");
image = rgb2gray(image);
image = image(:);
[rows , colm]=size(image);
[pixelCounts, gray_value]=imhist(image);
prob=pixelCounts(:)./(rows*colm);
%mat = [prob, gray_value];
dict = huffmandict(gray_value,prob);
