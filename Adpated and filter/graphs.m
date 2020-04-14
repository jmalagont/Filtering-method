clc
clear all
close all
pkg load image

im=imread("C:/Users/usuario/Documents/Tesis/Result/Augmented Data-set/A3tp.bmp");
u=graythresh(im);
gim=im>u*255;
figure
imshow(im)
figure
imshow(gim)
