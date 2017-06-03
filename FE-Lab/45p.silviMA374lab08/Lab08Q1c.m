T = 0.5;
r = 0.05;
A = 1;

for i= 1:20
	X21 = X2(size(X2,1)-22*i:size(X2,1)-1);
	X22 = X2(size(X2,1)-22*i+1:size(X2,1));
	R = (X22-X21)./X21;
	V(i) = std(R)*sqrt(22*i)*sqrt(12/i);
	S0 = X2(size(X2,1));
	K = A*S0;
	sigma = V(i);
    d1 = (log(S0/K) + (r + sigma*sigma*0.5)*T)/(sigma*sqrt(T));
    d2 = d1 - sigma*sqrt(T);
    C(i) = normcdf(d1)*S0-normcdf(d2)*K*exp(-r*(T));
    P(i) = K*exp(-r*T) -S0 +C(i);
	L(i) = i*22;
end
plot(L,C);
xlabel('Length of Interval');
ylabel('Volatility');
title('Alphabet');
