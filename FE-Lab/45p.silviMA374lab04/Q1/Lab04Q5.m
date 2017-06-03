m = [0.1,0.2,0.15];
C = [0.005,-0.010,0.004;
    -0.010,0.040,-0.002;
    0.004,-0.002,0.023];

u = [1,1,1];
R = 0.1;
invC = pinv(C);
minw = (u*invC)/(u*invC*u');
minsigma = sqrt(minw*C*minw');
minmu = minw*m'; 
M = [m*invC*m',u*invC*m';
    m*invC*u',u*invC*u'];
detM = det(M);

mu = [];
sigma = [];
idx = 1;
wMarket = ((m-R*u)*invC)/((m-R*u)*invC*u');
muMarket = wMarket*m';
sigmaMarket = sqrt(wMarket*C*wMarket');


for i=0:0.01:0.05
    mu(idx) = R + ((muMarket - R)/sigmaMarket)*i;
    sigma(idx) = i;
    idx = idx + 1;
end
plot(sigma,mu,'r');
hold on;
sigma = [];
mu = [];
idx = 1;
for i = minmu:0.001:0.2
    
    A = [i,u*invC*m';
        1 u*invC*u'];
    B = [m*invC*m',i;
        m*invC*u',1];
    wOpt = (det(A)/detM)*m*invC + (det(B)/detM)*u*invC;
    mu(idx) = i;
    sigma(idx) = sqrt(wOpt*C*wOpt');
    idx = idx + 1;
end
plot(sigma,mu,'b');
hold off;
legend('Capital Market Line','Markowits Efficient Frontier');
title('Capital Market Line');
xlabel('sigma');
ylabel('mu');
