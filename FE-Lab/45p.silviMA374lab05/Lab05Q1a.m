m = [0.1,0.2,0.15];
C = [0.005,-0.010,0.004;
    -0.010,0.040,-0.002;
    0.004,-0.002,0.023];
mu = [];
sigma = [];
idx = 1;
u = [1,1,1];
invC = inv(C);
minw = (u*invC)/(u*invC*u');
minsigma = sqrt(minw*C*minw');
minmu = minw*m'; 
M = [m*invC*m',u*invC*m';
    m*invC*u',u*invC*u'];
detM = det(M);
for i = -1:0.01:1
    for j = -1:0.01:1
        for k = -1:0.01:1
            if(i+j+k == 1)
                w = [i,j,k];
                mtemp = w*m';
                if(mtemp >= minmu)
                    mu(idx) = w*m';
                    sigma(idx) = sqrt(w*C*w');
                    idx = idx + 1;
                end
            end
        end
    end
end
plot(sigma,mu,'k');
hold on;
mu = [];
sigma = [];
idx = 1;
for i = 0:0.001:0.3
    
    A = [i,u*invC*m';
        1 u*invC*u'];
    B = [m*invC*m',i;
        m*invC*u',1];
    wOpt = (det(A)/detM)*m*invC + (det(B)/detM)*u*invC;
    mu(idx) = i;
    sigma(idx) = sqrt(wOpt*C*wOpt');
    idx = idx + 1;
end
plot(sigma,mu,'m');
mu = [];
sigma = [];
idx = 1;
m = [0.1,0.2];
C = [0.005,-0.010;
    -0.010,0.040];
u = [1,1];
invC = inv(C);
minw = (u*invC)/(u*invC*u');
minsigma = sqrt(minw*C*minw');
minmu = minw*m'; 
M = [m*invC*m',u*invC*m';
    m*invC*u',u*invC*u'];
detM = det(M);
for i = 0:0.001:0.3
    
    A = [i,u*invC*m';
        1 u*invC*u'];
    B = [m*invC*m',i;
        m*invC*u',1];
    wOpt = (det(A)/detM)*m*invC + (det(B)/detM)*u*invC;
    mu(idx) = i;
    sigma(idx) = sqrt(wOpt*C*wOpt');
    idx = idx + 1;
end
plot(sigma,mu,'g');
mu = [];
sigma = [];
idx = 1;
m = [0.2,0.15];
C =[ 0.040,-0.002;
    -0.002,0.023];
u = [1,1];
invC = inv(C);
minw = (u*invC)/(u*invC*u');
minsigma = sqrt(minw*C*minw');
minmu = minw*m';
M = [m*invC*m',u*invC*m';
    m*invC*u',u*invC*u'];
detM = det(M);
for i = 0:0.001:0.3
    
    A = [i,u*invC*m';
        1 u*invC*u'];
    B = [m*invC*m',i;
        m*invC*u',1];
    wOpt = (det(A)/detM)*m*invC + (det(B)/detM)*u*invC;
    mu(idx) = i;
    sigma(idx) = sqrt(wOpt*C*wOpt');
    idx = idx + 1;
end
plot(sigma,mu,'r');
mu = [];
sigma = [];
idx = 1;
m = [0.1,0.15];
C = [0.005,0.004;
    0.004,0.023];
u = [1,1];
invC = inv(C);
minw = (u*invC)/(u*invC*u');
minsigma = sqrt(minw*C*minw');
minmu = minw*m'; 
M = [m*invC*m',u*invC*m';
    m*invC*u',u*invC*u'];
detM = det(M);
for i = 0:0.001:0.3
    
    A = [i,u*invC*m';
        1 u*invC*u'];
    B = [m*invC*m',i;
        m*invC*u',1];
    wOpt = (det(A)/detM)*m*invC + (det(B)/detM)*u*invC;
    mu(idx) = i;
    sigma(idx) = sqrt(wOpt*C*wOpt');
    idx = idx + 1;
end
plot(sigma,mu,'c');
xlabel('sigma');
ylabel('mu');
hold off;
legend('Feasible set','Minimum variance line (1,2,3)','Minmimum variance line (1,2)','Minimum variance line (2,3)','Minimum variance line (1,3)');