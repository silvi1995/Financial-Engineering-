T = 0.5;
r = 0.05;
A = 1.5;

S0 = [X1(size(X1,1)),X2(size(X2,1)),X3(size(X3,1)),X4(size(X4,1)),X5(size(X5,1)),X6(size(X6,1)),X7(size(X7,1)),X8(size(X8,1)),X9(size(X9,1)),X10(size(X10,1))];
S1 = [Y1(size(Y1,1)),Y2(size(Y2,1)),Y3(size(Y3,1)),Y4(size(Y4,1)),Y5(size(Y5,1)),Y6(size(Y6,1)),Y7(size(Y7,1)),Y8(size(Y8,1)),Y9(size(Y9,1)),Y10(size(Y10,1))];
S2 = [Z1(size(Z1,1)),Z2(size(Z2,1))];

for i= 1:10
    K = A*S0(i);
    sigma = V(i)*sqrt(12);
    d1 = (log(S0(i)/K) + (r + sigma*sigma*0.5)*T)/(sigma*sqrt(T));
    d2 = d1 - sigma*sqrt(T);
    C(i) = normcdf(d1)*S0(i)-normcdf(d2)*K*exp(-r*(T));
    P(i) = K*exp(-r*T) -S0(i) +C(i);
end

for i= 1:10
    K = A*S1(i);
    sigma = W(i)*sqrt(12);
    d1 = (log(S1(i)/K) + (r + sigma*sigma*0.5)*T)/(sigma*sqrt(T));
    d2 = d1 - sigma*sqrt(T);
    C1(i) = normcdf(d1)*S1(i)-normcdf(d2)*K*exp(-r*(T));
    P1(i) = K*exp(-r*T) -S1(i) +C1(i);
end

 K = A*S2(1);
sigma =  0.0627*sqrt(12);
d1 = (log(S2(1)/K) + (r + sigma*sigma*0.5)*T)/(sigma*sqrt(T));
d2 = d1 - sigma*sqrt(T);
C2(1) = normcdf(d1)*S2(1)-normcdf(d2)*K*exp(-r*(T));
P2(1) = K*exp(-r*T) -S2(1) +C2(1);
    
K = A*S2(2);
sigma = 0.0574*sqrt(12);
d1 = (log(S2(2)/K) + (r + sigma*sigma*0.5)*T)/(sigma*sqrt(T));
d2 = d1 - sigma*sqrt(T);
C2(2) = normcdf(d1)*S2(2)-normcdf(d2)*K*exp(-r*(T));
P2(2) = K*exp(-r*T) -S2(2) +C2(2);
       
