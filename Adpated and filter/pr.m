clc
clear all
close all
addpath ("C:/Users/usuario/Documents/Tesis/Algorithm/Common")
addpath ("C:/Users/usuario/Documents/Tesis/Algorithm/segmentation")


im=imread("C:/Users/usuario/Documents/Tesis/Result/Augmented Data-set/PrA1t.bmp");
fim = Rampfl (im,[0:180]);

L = w_segmentation (fim, [345,321], [600,600]);

figure
imshow(im)

figure
imshow(fim)

figure
imshow(L)
#gim=imread("C:/Users/usuario/Documents/Tesis/Result/Augment Ground truth/PrAG1t.bmp");
#gim=gim/255;
#imshow(im.*gim)