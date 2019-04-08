
%параметры сигнала
T=3;
t=0:0.001:2*T;
sizet=size(t,2);
%закон изменения частоты
w0=50;
wk=200;
%параметры поиска
tau0=3; 
%шум
noiseG=normrnd(0,0.1,size(t));
%лчм+шум
a=1;
b=(wk-w0)/(2*T);
f=exp(-a*((t-tau0).^2)/2+1i*(w0+b*(t-tau0)).*(t-tau0)+1i*100*(t-tau0))+noiseG;
plot(t,f)
xlabel('t, с', 'FontSize',14,'FontWeight','bold')