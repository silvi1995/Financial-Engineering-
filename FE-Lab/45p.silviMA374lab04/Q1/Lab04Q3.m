m = [0.1,0.2,0.15];
C = [0.005,-0.010,0.004;
    -0.010,0.040,-0.002;
    0.004,-0.002,0.023];
idx = 1;

u = [1,1,1];
invC = inv(C);
minw = (u*invC)/(u*invC*u');
minsigma = sqrt(minw*C*minw');
minmu = minw*m'; 
mu = [];
sigma = [];
M = [m*invC*m',u*invC*m';
    m*invC*u',u*invC*u'];
detM = det(M);
index = 1;

for i = 0:0.001:0.3
    
    A = [i,u*invC*m';
        1 u*invC*u'];
    B = [m*invC*m',i;
        m*invC*u',1];
    wOpt = (det(A)/detM)*m*invC + (det(B)/detM)*u*invC;
    mu(idx) = i;
    sigma(idx) = sqrt(wOpt*C*wOpt');
    if(abs(sigma(idx)-0.15) <= 0.001)
        ans(index) = mu(idx);
        index = index + 1;
    end
    idx = idx + 1;
end

if(ans(1) >= ans(2))
    maxmu = ans(1);
    minmu = ans(2);
end
if(ans(2) > ans(1))
    maxmu = ans(2);
    minmu = ans(1);
end

maxmu
minmu