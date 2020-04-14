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
## @deftypefn {} {@var{retval} =} deformation (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: usuario <usuario@DESKTOP-6T68KBR>
## Created: 2019-08-03

function nim = deformation (nim,img, r)
pkg load image
u = graythresh(nim);
BW = im2bw(nim,u);

[y,z]=find(BW==1);

imgs= size(img);

subim=img(:,min(z):max(z));
subims=size(subim);
subim=imresize(subim,[subims(1),floor(subims(2)*r)]);
nim=[img(:,1:min(z)),subim, img(:,max(z):end)];
nim=imresize(nim,imgs);


endfunction