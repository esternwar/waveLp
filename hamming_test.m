
%��������� �������
T=3;
t=0:0.001:2*T;
sizet=size(t,2);
%����� ��������� �������
w0=50;
wk=200;
%��������� ������
tau0=3; 
%���
noiseG=normrnd(0,0.1,size(t));
%���+���
a=1;
b=(wk-w0)/(2*T);
f=exp(-a*((t-tau0).^2)/2+1i*(w0+b*(t-tau0)).*(t-tau0)+1i*100*(t-tau0))+noiseG;
plot(t,f)
xlabel('t, �', 'FontSize',14,'FontWeight','bold')