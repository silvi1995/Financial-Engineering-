T = 1;
K = 1;
r = 0.05;
sigma = 0.6;
t = [0, 0.2, 0.4, 0.6, 0.8, 1];
s = 0.05;
S = [];
for i = 1:6
    for j = 1:100
        K = 0.001*j;
        d1 = (log(s/K) + (r + sigma*sigma*0.5)*(T-t(i)))/(sigma*sqrt(T-t(i)));
        d2 = d1 - sigma*sqrt(T-t(i));
        C(i,j) = normcdf(d1)*s-normcdf(d2)*K*exp(-r*(T-t(i)));
        P(i,j) = K*exp(-r*(T-t(i))) -s + C(i,j);
        S(j) = K;
    end
end
plot(S,C(1,:),'r');
hold on;
plot(S,C(2,:),'b');
hold on;
plot(S,C(3,:),'m');
hold on;
plot(S,C(4,:),'k');
hold on;
plot(S,C(5,:),'g');
hold on;
plot(S,C(6,:),'y');
hold off;
legend('t = 0','t = 0.2','t = 0.4','t = 0.6','t = 0.8','t = 1');
xlabel('K');
ylabel('Price Of European Call');
title('European Call');