clear

%a = -40:1:40;
Y = 2;
b = 5;
A = 0.5;
k = pi/5;
%n = 0:0.5:7;
n = 6;
wt = pi*n/4;
F = [];
X = [];

F1 = 0.5*k*A;
for a=-40:1:40
    F2 = (b*Y)/(A*(a^2 + Y^2));
    fun = @(a)((a.^2-Y^2).*sin(k*a - wt) + a*Y.*cos(k*a-wt))./((a.^2+Y^2).^2);
    F3 = integral(fun, -40, a);
    
    F = [F F1 + F2 + F3];
    
    X = [X a + (b*a)/(a^2+Y^2) - A*sin(k*a-wt)];
end

plot(X, F)