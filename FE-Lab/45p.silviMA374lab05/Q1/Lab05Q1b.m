m = [0.1,0.2,0.15];
C = [0.005,-0.010,0.004;
    -0.010,0.040,-0.002;
    0.004,-0.002,0.023];
mu = [];
sigma = [];
idx = 1;
u = [1,1,1];
invC = inv(C);
M = [m*invC*m',u*invC*m';
    m*invC*u',u*invC*u'];
detM = det(M);
w1 = [];
w2 = [];
w3 = [];
for i = 0:0.001:0.3
    
    A = [i,u*invC*m';
        1 u*invC*u'];
    B = [m*invC*m',i;
        m*invC*u',1];
    wOpt = (det(A)/detM)*m*invC + (det(B)/detM)*u*invC;
    w1(idx) = wOpt(1);
    w2(idx) = wOpt(2);
    w3(idx) = wOpt(3);
    idx = idx + 1;
end
plot3(w1,w2,w3);