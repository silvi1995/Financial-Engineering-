m = [0.1,0.2,0.15];
C = [0.005,-0.010,0.004;
    -0.010,0.040,-0.002;
    0.004,-0.002,0.023];
idx = 1;

u = [1,1,1];
minw = (u*inv(C))/(u*inv(C)*u');
minsigma = sqrt(minw*C*minw');
minmu = minw*m'; 
mu = [];
sigma = [];

for i = 0:0.01:1
    for j = 0:0.01:1
        for k = 0:0.01:1
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

minw 
minsigma
minmu

plot(sigma,mu);
title('Markowitz Bullet');
xlabel('sigma');
ylabel('mu');
