%параметры сигнала
T=3;
t=0:0.001:2*T;
sizet=size(t,2);
%закон изменения частоты
w0=50;
wk=200;
%параметры поиска
tau0=3; 
%лчм+шум
a=1;
b=(wk-w0)/(2*T);
f=exp(-a*((t-tau0).^2)/2+1i*(w0+b*(t-tau0)).*(t-tau0)+1i*100*(t-tau0));
n = 1;
minimums = []
while n < 20
    x = 1;
    y = 1;
    f_noise = f+(n*1.5*normrnd(0,0.1,size(t)));
    
    for tau=2.5:0.01:3.5
        for w=90:0.1:110
            g=exp(-a*((t-tau).^2)/2+1i*(w0+b*(t-tau)).*(t-tau0)+1i*w*(t-tau0));
            resfunc = (f_noise-g);
            DeltaTauW(x,y) = trapz((resfunc.*conj(resfunc)));
            x = x+1;
        end
        x=1;
        y = y+1;
    end
    minimums(n) = min(min(DeltaTauW));
    n = n+1;
end
