m = [0.001931,-0.006452,-0.014734,-0.005513,0.004634,0.006811,0.008655,-0.002001,0.012379,0.002047];
C = [0.65620,0,0,0,0,0,0,0,0,0;
    0,0.040926,0,0,0,0,0,0,0,0;
    0,0,0.041361,0,0,0,0,0,0,0;
    0,0,0,0.031987,0,0,0,0,0,0;
    0,0,0,0,0.025953,0,0,0,0,0;
    0,0,0,0,0,0.072685,0,0,0,0;
    0,0,0,0,0,0,0.038677,0,0,0;
    0,0,0,0,0,0,0,0.054276,0,0;
    0,0,0,0,0,0,0,0,0.049770,0;
    0,0,0,0,0,0,0,0,0,0.027449];
idx = 1;

u = [1,1,1,1,1,1,1,1,1,1];
C = C.^2;
invC = inv(C);
minw = (u*invC)/(u*invC*u');
minsigma = sqrt(minw*C*minw');
minmu = minw*m'; 
mu = [];
sigma = [];
M = [m*invC*m',u*invC*m';
    m*invC*u',u*invC*u'];
detM = det(M);

for i = minmu-0.1:0.001:0.5
    
    A = [i,u*invC*m';
        1 u*invC*u'];
    B = [m*invC*m',i;
        m*invC*u',1];
    wOpt = (det(A)/detM)*m*invC + (det(B)/detM)*u*invC;
    mu(idx) = i;
    sigma(idx) = sqrt(wOpt*C*wOpt');
    idx = idx + 1;
end

plot(sigma,mu);
title('Markowitz Efficient Frontier');
xlabel('sigma');
ylabel('mu');