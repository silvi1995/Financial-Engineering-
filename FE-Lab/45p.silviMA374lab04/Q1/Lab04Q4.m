m = [0.1,0.2,0.15];
C = [0.005,-0.010,0.004;
    -0.010,0.040,-0.002;
    0.004,-0.002,0.023];

u = [1,1,1];
invC = pinv(C);
mu = 0.18;
M = [m*invC*m',u*invC*m';
    m*invC*u',u*invC*u'];
detM = det(M);
    
A = [mu,u*invC*m';
    1 u*invC*u'];
B = [m*invC*m',mu;
    m*invC*u',1];

wOpt = (det(A)/detM)*m*invC + (det(B)/detM)*u*invC;
sigma = sqrt(wOpt*C*wOpt');
sigma
