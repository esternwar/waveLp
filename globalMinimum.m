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

fid = fopen('noisez.txt', 'rb'); 
B = fread(fid, [6001, 100], 'double');
fclose(fid);
noise = B';

while n < 50
    x = 1;
    y = 1;
    f_noise = f+noise(n,:);
    
    for tau=2.7:0.01:3.3
        for w=95:0.2:105
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

resArr = zeros(51,61);
for n = 1:1:50
    resArr = resArr + minimums(:,:,n);
end

for ind=1:1:50
    [value, index] = min(reshape(minimums(:,:,ind), numel(minimums(:,:,ind)), 1));
    [xCor,jCor] = ind2sub(size(minimums(:,:,ind)), index);
    tempArr(ind, 1) = value;
    tempArr(ind, 2) = xCor;
    tempArr(ind, 3) = jCor;
end