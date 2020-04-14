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
## @deftypefn {} {@var{retval} =} high_pass (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: usuario <usuario@DESKTOP-6T68KBR>
## Created: 2019-08-07

function neim = high_pass (im)
mask=zeros(size(im));
fim=fft2(im);
sfim=fftshift(fim);

for x=1:size(im,1)
  for y=1:size(im,2)
    x0=x-(size(im,1)/2);
    y0=y-(size(im,2)/2);
    z=sqrt((x0^2)+(y0^2))/4;
    v=(1/(4*sqrt(2*pi)))*exp(-0.5*(z^2));
    mask(x,y)=v;
    endfor
  endfor
  mask=mask/max(mask(:));
  mask=1-mask;
  fsfim=sfim.*mask;
  ffim=ifftshift(fsfim);
  neim=abs(ifft2(ffim));
endfunction