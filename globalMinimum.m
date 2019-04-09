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

while n < 10
    x = 1;
    y = 1;
    f_noise = f+(9*normrnd(0,0.1,1,size(t)));
    
    for tau=2.5:0.02:3.5
        for w=90:0.2:110
            g=exp(-a*((t-tau).^2)/2+1i*(w0+b*(t-tau)).*(t-tau0)+1i*w*(t-tau0));
            resfunc = (f_noise-g);
            DeltaTauW(x,y) = trapz((resfunc.*conj(resfunc)));
            x = x+1;
        end
        x=1;
        y = y+1;
    end
    minimums(:,:,n) = DeltaTauW;
    n = n+1;
end

resArr = zeros(101,51)
for n = 1:1:9
    resArr = resArr + minimums(:,:,n);
end
% for ind=1:1:9
%     [value, index] = min(reshape(minimums(:,:,n), numel(minimums(:,:,n)), 1));
%     [xCor,jCor] = ind2sub(size(minimums(:,:,n)), index)
%     tempArr(ind, ind) = value;
%     tempArr(ind, ind+1) = xCor;
%     tempArr(ind, ind+3) = jCor;
% end