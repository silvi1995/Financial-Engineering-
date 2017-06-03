clear;
beta = [0.02,0.7,0.06];
mu = [0.7,0.1,0.09];
sigma = [0.02,0.3,0.5];
r0 = [0.1,0.2,0.02];


for k = 1:3
    t(1) = 0;
    r(1) = r0(k);
    j = 2;
    delt = 0.1;
    for i = 0.1:0.1:1
        t(j) = i;
        z = normrnd(0,1);
        r(j) = (r(j-1) + beta(k)*(mu(k)-r(j-1))*delt + sigma(k)*sqrt(r(j-1))*sqrt(delt)*z);
        j = j + 1;
    end
    plot(t,r);
    hold on;
end


title('time versus yield');
xlabel('time');
ylabel('yield');
hold off;
