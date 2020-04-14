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
## @deftypefn {} {@var{retval} =} MMM (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: usuario <usuario@DESKTOP-6T68KBR>
## Created: 2019-08-07
function nim = MMM (im, wz)
wsz=floor(wz/2);
rep=zeros(size(im)+2*wz);
nrep=zeros(size(im)+2*wz);
rep(wz+1:size(im,1)+wz,wz+1:size(im,2)+wz)=im;
rep=uint8(rep);
for x=wz+1:size(im,1)+wz
  for y=wz+1:size(im,2)+wz
    w=rep(x-wsz:x+wsz,y-wsz:y+wsz);
    med=median(w(:));
    men=mean(w(:));
    
    v=max([med,men]);
    nrep(x,y)=v;
    endfor
  endfor
  nim=nrep(wz+1:size(im,1)+wz,wz+1:size(im,2)+wz);
  nim=uint8(nim);
endfunction
