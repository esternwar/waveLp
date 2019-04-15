
%параметры сигнала
T=3;
t=0:0.001:2*T;
sizet=size(t,2);
%закон изменени€ частоты
w0=50;
wk=200;
%параметры поиска
tau0=3; 
%шум
noiseG=15*normrnd(0,0.1,size(t));
%лчм+шум
a=1;
b=(wk-w0)/(2*T);
f=exp(-a*((t-tau0).^2)/2+1i*(w0+b*(t-tau0)).*(t-tau0)+1i*55*(t-tau0));
%plot(t,f)
% xlabel('t, с', 'FontSize',14,'FontWeight','bold')
% ylabel('A','FontSize',14,'FontWeight','bold', 'Rotation', 0)

sizeDT = length(2.5:0.01:3.5);
% temp = 1;
% DeltaTau = zeros(sizeDT,1);
% for tau=2.5:0.01:3.5
%     g=exp(-a*((t-tau).^2)/2+1i*(w0+b*(t-tau)).*(t-tau)+1i*100*(t-tau));
%     resfunc = (f-g);
%     DeltaTau(temp,1) = trapz((resfunc.*conj(resfunc)));
%     temp = temp+1;
% end
% plot((2.5:0.01:3.5),(DeltaTau/1000))
% xlabel('t, с', 'FontSize',14,'FontWeight','bold')
% ylabel('L2','FontSize',14,'FontWeight','bold', 'Rotation', 0)

% sizeDW = length(80:0.1:120);
% temp = 1;
% DeltaW = zeros(sizeDW,1);
% 
% for w=80:0.1:120
%     g=exp(-a*((t-tau0).^2)/2+1i*(w0+b*(t-tau0)).*(t-tau0)+1i*w*(t-tau0));
%     resfunc = (f-g);
%     DeltaW(temp,1) = trapz((resfunc.*conj(resfunc)))/1000;
%     temp = temp+1;
% end
% plot((80:0.1:120),(DeltaW))
%  xlabel('w, г÷', 'FontSize',14,'FontWeight','bold')
% ylabel('L2','FontSize',14,'FontWeight','bold', 'Rotation', 0)

sizeDW = 2:0.02:4;
sizeDT = 70:0.3:120;
x = 1;
y = 1;

for tau=2:0.02:4
    for w=20:0.3:70
        g=exp(-a*((t-tau).^2)/2+1i*(w0+b*(t-tau)).*(t-tau0)+1i*w*(t-tau0));
       %g=exp(-a*((t-tau).^2)/2+1i*(w0+b*(t-tau)).*(t-tau0)+1i*w*(t-tau0))
        resfunc = (f-g);
        DeltaTauW(x,y) = trapz((resfunc.*conj(resfunc)));
        x = x+1;
    end
    x=1;
    y = y+1;
end
mesh(DeltaTauW)
%min(min(DeltaTauW))
% figure(1)
% colorbar
% mesh((1:0.1:5), (80:0.1:110), DeltaTauW)
% xlabel('t, с', 'FontSize',14,'FontWeight','bold')
% ylabel('w, √ц','FontSize',14,'FontWeight','bold', 'Rotation', 0)
% zlabel('L2', 'FontSize',14,'FontWeight','bold', 'Rotation', 0)

% sizeDT = length(0:0.01:6);
% temp = 1;
% DeltaTau = zeros(sizeDT,1);
% for tau=0:0.01:6
%     g=exp(-a*((t-tau).^2)/2+i*b*(t-tau).^2+i*w0*(t-tau));
%     k =corrcoef(f,g);
%     DeltaTau(temp,1) = -1*k(2);
%     temp = temp+1;
% end
% plot((0:0.01:6),(DeltaTau))

% sizeDW = length(0:1:150);
% temp = 1;
% DeltaW = zeros(sizeDW,1);
% for w=0:1:150
%     g=exp(-a*((t-tau0).^2)/2+i*b*(t-tau0).^2+i*w*(t-tau0));
%    k =corrcoef(f,g);
%    DeltaW(temp,1) = k(2);
%     temp = temp+1;
% end
% plot((0:1:150),DeltaW)

% sizeDW = length(0:1:200);
% sizeDT = length(0:0.1:6);
% x = 1;
% y = 1;
% for tau=0:0.1:6
%     for w=20:0.1:60
%         g=exp(-a*((t-tau).^2)/2+i*b*(t-tau).^2+i*w*(t-tau));
%         k =corrcoef(f,g);
%         DeltaTauW(x,y) =  (real(k(2)))^2;
%         x = x+1;
%     end
%     x=1;
%     y = y+1;
% end
% mesh(DeltaTauW)

