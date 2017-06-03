clear;
t(1) = 0;
r = 0.05;
mu = 0.1;
sigma = 0.2;
delt = 0.5/1000;

for j = 1:10
    S(j,1) = 100;
    for i=2:1000
        Z = normrnd(0,1);
        S(j,i) = S(j,i-1)*exp((mu - 0.5*sigma*sigma)*delt + sigma*(sqrt(delt)*Z));
        t(i) = t(i-1) + delt;
    end
end

hold on;
plot(t,S(1,:),'r');
plot(t,S(2,:),'b');
plot(t,S(3,:),'y');
plot(t,S(4,:),'k');
plot(t,S(5,:),'r');
plot(t,S(6,:),'b');
plot(t,S(7,:),'m');
plot(t,S(8,:),'r');
plot(t,S(9,:),'k');
plot(t,S(10,:),'r');
hold off;

title('Asset prices in real world : 10 different paths');
xlabel('Time');
ylabel('Asset Price');
