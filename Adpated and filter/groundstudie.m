
clear all
close all
clc

A=imread("C:/Users/usuario/Documents/Tesis/Data-set/Ground truth studie/A.jpg");
B=imread("C:/Users/usuario/Documents/Tesis/Data-set/Ground truth studie/B.jpg");
C=imread("C:/Users/usuario/Documents/Tesis/Data-set/Ground truth studie/C.jpg");
A=logical(A/255);
B=logical(B/255);
C=logical(C/255);

imf=A+B+C;
imf=imf>=2;

figure
imagesc(imf)

imf1=5*A+20*B+100*C;

figure
imagesc(imf1)

d=(((imf-A).^2)+((imf-B).^2)+((imf-C).^2))./3;
cof=sum(d(:))/sum(imf(:));