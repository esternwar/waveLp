function [ res ] = RES( t, tau )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% ft=0.001;
% ff=1;
 T=3;
% t=0:ft:4*T;
% sizet=size(t,2);
% %закон изменения частоты
 w0=150;
 wk=200;
 b=(wk-w0)/(2*T);
% w=w0+2*pi*b*t;
% %параметры поиска
 tau0=3;
 W0=100;
f=exp(-pi*(((t-tau0)-0.5*T)/(0.5*T)).^2).*exp(i*(w0+b*(t-tau0)).*(t-tau0));
g=exp(-pi*(((t-tau)-0.5*T)/(0.5*T)).^2).*exp(i*(w0+b*(t-tau)).*(t-tau));
res =f - g
end

