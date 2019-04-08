clear
ft=0.001;
ff=1;
T=3;
t=0:ft:2*T;
sizet=size(t,2);
%закон изменения частоты
w0=150;
wk=200;
b=(wk-w0)/(2*T);
w=w0+2*pi*b*t;
%параметры поиска
tau0=3;
W0=100;
%шум
noiseG=normrnd(0,0.1,size(t));
%лчм+шум
f=exp(-pi*(((t-tau0)-0.5*T)/(0.5*T)).^2).*exp(i*(w0+b*(t-tau0)).*(t-tau0));
fun = @(t, tau) (exp(-pi*(((t-3)-0.5*3)/(0.5*3)).^2).*exp(i*(150+8*(t-3)).*(t-3)) - exp(-pi*(((t-tau)-0.5*3)/(0.5*3)).^2).*exp(i*(150+8*(t-tau)).*(t-tau))).^2;
temp = 1
for tau=0:0.01:6
i(temp) = integral(@(t)fun(t,tau), 0, 2*T);
temp = temp + 1;
end

xlable = 0:0.01:6;
plot(xlable, i)

% temp = 1;
% W=100;
% delim = 0.01;
% % for tau=0:0.01:6
% %     g=exp(-pi*(((t-tau)-0.5*T)/(0.5*T)).^2).*exp(i*(w0+b*(t-tau)).*(t-tau));
% %     resfunc = (f-g);
% %     DeltaTau(temp,1) =  trapz((resfunc.*conj(resfunc)).^2);
% %     temp = temp+1;
% % end
% i = zeros(15,1)
% % - exp(-pi*(((t-3)-0.5*tau)/(0.5*3)).^2).*exp(i*(150+8.3*(t-tau)).*(t-tau))
% fun2 = @(t, tau) exp(-pi*(((t-3)-0.5*3)/(0.5*3)).^2)*exp(i*(150+8.3*(t-3))*(t-3));
% fun = @(t,c) 1./(t.^3-2*t-c);
% tau=0:1:15
% i = integral(@(t)fun2(t,3), 0, 10);

% tau=0:0.01:6;
% plot(tau, real(DeltaTau))