## Copyright (C) 2019 usuario
## 
## This program is free software: you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see
## <https://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} Augmentation (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: usuario <usuario@DESKTOP-6T68KBR>
## Created: 2019-07-28

function nim = Augmentation (simn,im,alpha,rr)
for x=1:length(im)
pkg load image
img=im{x}{1};
sim=simn{x}{1};
y=((x-1)*4);
img1= imrotate (img,90);
img2= imrotate (img,180);
img3= perspective (alpha, img,100,sim);
img4= deformation (sim',img',rr)';
nn=substr (im{x}{2}, 2, length(im{x}{2})-1);
nim{y+1}={img1,strcat("/R",nn)};
nim{y+2}={img2,strcat("/Rf",nn)};
nim{y+3}={img3,strcat("/Pr",nn)};
nim{y+4}={img4,strcat("/Df",nn)};

imshow([img,img1; img3, img4]);
pause(0.000000000000000000000000000000000000000000000000000000000000000000000000000001)
hold off
endfor

endfunction