clc
clear all
close all


addpath ("C:/Users/usuario/Documents/Tesis/Algorithm/Common")

path="C:/Users/usuario/Documents/Tesis/Result/Augmented Data-set";
im = fileextraction(path);

save_path="C:/Users/usuario/Documents/Tesis/Result/Filtered Data-set/MMM/";

for x=1:length(im)
  img=im{x}{1};
  imgname=im{x}{2};
  
  fimg=MMM (img, 5);
 
  
  imshow(fimg);
  pause(0.0000000000000000000001);
  hold off
  
  imwrite(fimg,strcat(save_path,imgname));
  
  endfor
#gim = adaptation (gim);
#im = adaptation (im);

#im = Augmentation (gim,im,40,0.4);
#save_path="C:/Users/usuario/Documents/Tesis/Result/Augment Ground truth";
#Save_info (im,save_path);