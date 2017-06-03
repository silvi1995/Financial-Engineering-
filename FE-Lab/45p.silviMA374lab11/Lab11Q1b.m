clear;
beta = [5.9,3.9,0.1];
mu = [0.2,0.1,0.1];
sigma = [0.3,0.3,0.11];
r0 = [0.1,0.2,0.1];


for k = 1:3
    t(1) = 0;
    r(1) = r0(k);
    j = 2;
    delt = 0.1;
    for i = 0.1:0.1:1
        t(j) = i;
        z = normrnd(0,1);
        r(j) = (r(j-1) + beta(k)*(mu(k)-r(j-1))*delt + sigma(k)*sqrt(delt)*z);
        j = j + 1;
    end
    plot(t,r);
    hold on;
end


title('time versus yield');
xlabel('time');
ylabel('yield');
hold off;