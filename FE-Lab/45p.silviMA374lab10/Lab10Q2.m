clear;
t(1) = 0;
r = 0.05;
mu = 0.1;
sigma = 0.2;
delt = 0.5/1000;
K = 110;

for j = 1:1000
    S(j,1) = 100;
    for i=2:1000
        Z = normrnd(0,1);
        S(j,i) = S(j,i-1)*exp((mu - 0.5*sigma*sigma)*delt + sigma*(sqrt(delt)*Z));
        t(i) = t(i-1) + delt;
    end
end

for j = 1:1000
    avg(j) = 0; 
    for i=1:1000
        avg(j) = avg(j) + S(j,i);
    end
    avg(j) = avg(j)/1000;
    if(avg(j) >= K)
        Callprice(j) = avg(j) - K;
        Putprice(j) = 0;
    else
        Callprice(j) = 0;
        Putprice(j) = K - avg(j);
    end
end

FinalPriceCall = 0;
FinalPricePut = 0;
for i= 1:1000
    FinalPriceCall = FinalPriceCall + Callprice(i);
    FinalPricePut = FinalPricePut + Putprice(i);   
end

FinalPriceCall = FinalPriceCall/1000;
FinalPricePut = FinalPricePut/1000;

FinalPriceCall
FinalPricePut

ConfidenceIntervalCall1 = FinalPriceCall - 1.96*std(Callprice)/sqrt(1000);
ConfidenceIntervalCall2 = FinalPriceCall + 1.96*std(Callprice)/sqrt(1000);

ConfidenceIntervalPut1 = FinalPricePut - 1.96*std(Putprice)/sqrt(1000);
ConfidenceIntervalPut2 = FinalPricePut + 1.96*std(Putprice)/sqrt(1000);



