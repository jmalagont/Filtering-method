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
## @deftypefn {} {@var{retval} =} perspective (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: usuario <usuario@DESKTOP-6T68KBR>
## Created: 2019-07-29
function nim = perspective (alpha, img,q , imn)

pkg load image
u = graythresh(imn);
BW = im2bw(imn,u);

[y,z]=find(BW==1);
x1=min(z)+q;
y1=min(y)+q;
x2=max(z)-q;
y2=min(y)+q;
x3=min(z)+q;
y3=max(y)-q;
x4=max(z)-q;
y4=max(y)-q;

c=x2-x1;
b=c*cosd(alpha);
a=c*sind(alpha);
d=y4-y2;
dp=d*cosd(alpha);
theta=(d-dp)/2;

x1p=x1;
y1p=y1;
x2p=x1+b;
y2p=y2+theta;
x3p=x3;
y3p=y3;
x4p=x2p;
y4p=y4-theta;

inpo={[[x1,y1];[x2,y2];[x4,y4];[x3,y3]],[[0,0];[x1,y1];[x3,y3];[0,size(img,1)]],[[0,0];[x1,y1];[x2,y2];[size(img,1),0]]...
,[[size(img,1),0];[x2,y2];[x4,y4];[size(img,1),size(img,1)]],[[size(img,1),size(img,1)];[x4,y4];[x3,y3];[0,size(img,1)]]};
outpo={[[x1p,y1p];[x2p,y2p];[x4p,y4p];[x3p,y3p]],[[0,0];[x1p,y1p];[x3p,y3p];[0,size(img,1)]],[[0,0];[x1p,y1p];[x2p,y2p];[size(img,1),0]]...
,[[size(img,1),0];[x2p,y2p];[x4p,y4p];[size(img,1),size(img,1)]],[[size(img,1),size(img,1)];[x4p,y4p];[x3p,y3p];[0,size(img,1)]]};
nim=zeros(size(img));
for x=1:length(inpo)
  mask=zeros(size(img));
  poi=inpo{x};
  opoi=outpo{x};
  smask=poly2mask(poi(:,1),poi(:,2), size(img,1), size(img,2));
  mask(smask)=1;
  T = maketform ('projective', poi, opoi);
  tr = imtransform (img.*mask, T,"xdata",[1 size(img,1)],"ydata",[1 size(img,2)]);
  tr = imresize(tr,size(img));
  nim =(nim+tr);
endfor
nim= medfilt2(nim,[11 11]);
#nim=mask

endfunction