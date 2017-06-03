T = 1;
K = 1;
r = 0.05;
sigma = 0.6;
t = [0, 0.2, 0.4, 0.6, 0.8, 1];
s = 0.05;
for i = 1:6
    for j = 1:100
        K = 0.01*j;
        d1 = (log(s/K) + (r + sigma*sigma*0.5)*(T-t(i)))/(sigma*sqrt(T-t(i)));
        d2 = d1 - sigma*sqrt(T-t(i));
        C(i,j) = normcdf(d1)*s-normcdf(d2)*K*exp(-r*(T-t(i)));
        P(i,j) = K*exp(-r*(T-t(i))) -s + C(i,j);
        R(j) = K;
    end
end
[X,Y] = meshgrid(t,R);
surf(X,Y,P');
title('European Put');
xlabel('t');
ylabel('Strike Price');