Y = load('NIFTY_100.txt');

X1 = load('ACCLtd.txt');
X2 = load('AdaniPortsAndSpecialEconomicZone.txt');
X3 = load('AmbujaCementsLtd.txt');
X4 = load('AshokLeylandLtd.txt');
X5 = load('AsianPaintsLtd.txt');
X6 = load('AurobindoPharmaLtd.txt');
X7 = load('AxisBankLtd.txt');
X8 = load('BankOfBaroda.txt');
X9 = load('BankOfIndia.txt');
X10 = load('Bosch.txt');

a = size(Y,1);
b1 = size(X1,1);
b2 = size(X2,1);
b3 = size(X3,1);
b4 = size(X4,1);
b5 = size(X5,1);
b6 = size(X6,1);
b7 = size(X7,1);
b8 = size(X8,1);
b9 = size(X9,1);
b10 = size(X10,1);

c1 = min(a,b1);
c2 = min(a,b2);
c3 = min(a,b3);
c4 = min(a,b4);
c5 = min(a,b5);
c6 = min(a,b6);
c7 = min(a,b7);
c8 = min(a,b8);
c9 = min(a,b9);
c10 = min(a,b10);

beta = [];
Km = [];
Kv1 = [];
kv2 = [];
kv3 = [];
kv4 = [];
kv5 = [];
kv6 = [];
kv7 = [];
kv8 = [];
kv9 = [];
kv10 = [];
idx = 1;
for i=1:c1-1
    Km(idx) = (Y(i+1)-Y(i))/Y(i);
    Kv1(idx) = (X1(i+1)-X1(i))/X1(i);
    idx = idx + 1;
end
c = cov(Kv1,Km);
beta(1) = c(1,2)/c(1,1);
idx = 1;
Km =[];
for i=1:c2-1
    Km(idx) = (Y(i+1)-Y(i))/Y(i);
    Kv2(idx) = (X2(i+1)-X2(i))/X2(i);
    idx = idx + 1;
end
c = cov(Kv2,Km);
beta(2) = c(1,2)/c(1,1);
idx = 1;
Km = [];
for i=1:c3-1
    Km(idx) = (Y(i+1)-Y(i))/Y(i);
    Kv3(idx) = (X3(i+1)-X3(i))/X3(i);
    idx = idx + 1;
end
c = cov(Kv3,Km);
beta(3) = c(1,2)/c(1,1);
idx = 1;
Km =[];
for i=1:c4-1
    Km(idx) = (Y(i+1)-Y(i))/Y(i);
    Kv4(idx) = (X4(i+1)-X4(i))/X4(i);
    idx = idx + 1;
end
c = cov(Kv4,Km);
beta(4) = c(1,2)/c(1,1);
idx = 1;
Km =[];
for i=1:c5-1
    Km(idx) = (Y(i+1)-Y(i))/Y(i);
    Kv5(idx) = (X5(i+1)-X5(i))/X5(i);
    idx = idx + 1;
end
c = cov(Kv5,Km);
beta(5) = c(1,2)/c(1,1);
idx = 1;
Km =[];
for i=1:c6-1
    Km(idx) = (Y(i+1)-Y(i))/Y(i);
    Kv6(idx) = (X6(i+1)-X6(i))/X6(i);
    idx = idx + 1;
end
c = cov(Kv6,Km);
beta(6) = c(1,2)/c(1,1);
idx = 1;
Km =[];
for i=1:c7-1
    Km(idx) = (Y(i+1)-Y(i))/Y(i);
    Kv7(idx) = (X7(i+1)-X7(i))/X7(i);
    idx = idx + 1;
end
c = cov(Kv7,Km);
beta(7) = c(1,2)/c(1,1);
idx = 1;
Km =[];
for i=1:c8-1
    Km(idx) = (Y(i+1)-Y(i))/Y(i);
    Kv8(idx) = (X8(i+1)-X8(i))/X8(i);
    idx = idx + 1;
end
c = cov(Kv8,Km);
beta(8) = c(1,2)/c(1,1);
idx = 1;
Km =[];
for i=1:c9-1
    Km(idx) = (Y(i+1)-Y(i))/Y(i);
    Kv9(idx) = (X9(i+1)-X9(i))/X9(i);
    idx = idx + 1;
end
c = cov(Kv9,Km);
beta(9) = c(1,2)/c(1,1);
idx = 1;
Km =[];
for i=1:c10-1
    Km(idx) = (Y(i+1)-Y(i))/Y(i);
    Kv10(idx) = (X10(i+1)-X10(i))/X10(i);
    idx = idx + 1;
end
c = cov(Kv10,Km);
beta(10) = c(1,2)/c(1,1);
