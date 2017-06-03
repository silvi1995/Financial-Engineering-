clear;
beta = [0.02,0.7,0.06];
mu = [0.7,0.1,0.09];
sigma = [0.02,0.3,0.5];
r0 = [0.1,0.2,0.02];


for i = 1:10
    tempr0 = r0(1) + i*0.1;
    t(1) = 0;
    r(1,i) = tempr0;
    j = 2;
    delt = 0.005;
    for k = 0.005:0.005:1
        z = normrnd(0,1);
        t(j) = k;
        r(j,i) = (r(j-1,i) + beta(1)*(mu(1)-r(j-1))*delt + sigma(1)*sqrt(delt)*z);
        j = j + 1;
end
    hold on;
end


plot(t,r(:,1),'r');
hold on;
plot(t,r(:,2),'b');
hold on;
plot(t,r(:,3),'y');
hold on;
plot(t,r(:,4),'k');
hold on;
plot(t,r(:,5),'m');
hold on;
plot(t,r(:,6),'r');
hold on;
plot(t,r(:,7),'g');
hold on;
plot(t,r(:,8),'k');
hold on;
plot(t,r(:,9),'b');
hold on;
plot(t,r(:,10),'g');
hold on;
title('Time versus yield for 10 values of r0 - Set 1');
xlabel('Time');
ylabel('Yield');
