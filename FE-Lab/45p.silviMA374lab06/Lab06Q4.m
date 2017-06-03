a = n2(1:size(n2,1)-1);
b = n2(2:size(n2,1));
c = min(size(a,1),size(b,1));
a = a(1:c);
b = b(1:c);
m = log(b./a);
m1 = mean(m);
v1 = var(m);
mu = (m1+v1/2);
S(1) = n2(1);
sigma = sqrt(v1);
Iter = 300;
while(Iter)
    for i= 2:c
            W = normrnd(0,1);
            S(i) = S(i-1)*exp((mu-sigma*sigma*0.5) + sigma*W); 
    end
    count = 0;
    for i=1:c
        if(abs(S(i) - n2(i)) < 0.5)
            count = count + 1;
        end
    end
    if(count >= c-50)
        break;
    end
    Iter = Iter - 1;
end
d = min(size(S,2),size(n2,1));
S = S(1:d);
n2 = n2(1:d);
plot(S,'b');
hold on;
plot(n2,'r');
hold off;
title('Bosch');
xlabel('Days');
ylabel('Price');
legend('Simulated price','Actual price');