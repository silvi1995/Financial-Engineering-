Y1 = load('ABBIndiaLtd.txt');
Y2 = load('ACCLtd.txt');
Y3 = load('AdaniPortsAndSpecialEconomicZone.txt');
Y4 = load('AmbujaCementsLtd.txt');
Y5 = load('AshokLeylandLtd.txt');
Y6 = load('AsianPaintsLtd.txt');
Y7 = load('AurobindoPharmaLtd.txt');
Y8 = load('AxisBankLtd.txt');
Y9 = load('BankOfBaroda.txt');
Y10 = load('BankOfIndia.txt');

X1 = load('AdityaBirlaNuvoLtd.txt');
X2 = load('Alphabet.txt'); 
X3 = load('Amazon.txt');
X4 = load('Danone.txt');
X5 = load('DollarGeneralCorporation.txt');
X6 = load('Facebook.txt');
X7 = load('HessCorporation.txt');
X8 = load('LibertyLilacGroup.txt');
X9 = load('MTNL.txt');
X10 = load('TajHotels.txt');

Z1 = load('ApolloHospitals.txt');
Z2 = load('Bosch.txt');

X11 = X1(size(X1)-22:size(X1)-1);
X12 = X1(size(X1)-21:size(X1));
R = (X12-X11)./X11;
S(1) = std(R);
V(1) = S(1)*sqrt(22);

X11 = X2(size(X2)-22:size(X2)-1);
X12 = X2(size(X2)-21:size(X2));
R = (X12-X11)./X11;
S(2) = std(R);
V(2) = S(2)*sqrt(22);

X11 = X3(size(X3)-22:size(X3)-1);
X12 = X3(size(X3)-21:size(X3));
R = (X12-X11)./X11;
S(3) = std(R);
V(3) = S(3)*sqrt(22);

X11 = X4(size(X4)-22:size(X4)-1);
X12 = X4(size(X4)-21:size(X4));
R = (X12-X11)./X11;
S(4) = std(R);
V(4) = S(4)*sqrt(22);

X11 = X5(size(X5)-22:size(X5)-1);
X12 = X5(size(X5)-21:size(X5));
R = (X12-X11)./X11;
S(5) = std(R);
V(5) = S(5)*sqrt(22);

X11 = X6(size(X6)-22:size(X6)-1);
X12 = X6(size(X6)-21:size(X6));
R = (X12-X11)./X11;
S(6) = std(R);
V(6) = S(6)*sqrt(22);

X11 = X7(size(X7)-22:size(X7)-1);
X12 = X7(size(X7)-21:size(X7));
R = (X12-X11)./X11;
S(7) = std(R);
V(7) = S(7)*sqrt(22);

X11 = X8(size(X8)-22:size(X8)-1);
X12 = X8(size(X8)-21:size(X8));
R = (X12-X11)./X11;
S(8) = std(R);
V(8) = S(8)*sqrt(22);

X11 = X9(size(X9)-22:size(X9)-1);
X12 = X9(size(X9)-21:size(X9));
R = (X12-X11)./X11;
S(9) = std(R);
V(9) = S(9)*sqrt(22);

X11 = X10(size(X10)-22:size(X10)-1);
X12 = X10(size(X10)-21:size(X10));
R = (X12-X11)./X11;
S(10) = std(R);
V(10) = S(10)*sqrt(22);



X11 = Y1(size(Y1)-22:size(Y1)-1);
X12 = Y1(size(Y1)-21:size(Y1));
R = (X12-X11)./X11;
S(1) = std(R);
W(1) = S(1)*sqrt(22);

X11 = Y2(size(Y2)-22:size(Y2)-1);
X12 = Y2(size(Y2)-21:size(Y2));
R = (X12-X11)./X11;
S(2) = std(R);
W(2) = S(2)*sqrt(22);

X11 = Y3(size(Y3)-22:size(Y3)-1);
X12 = Y3(size(Y3)-21:size(Y3));
R = (X12-X11)./X11;
S(3) = std(R);
W(3) = S(3)*sqrt(22);

X11 = Y4(size(Y4)-22:size(Y4)-1);
X12 = Y4(size(Y4)-21:size(Y4));
R = (X12-X11)./X11;
S(4) = std(R);
W(4) = S(4)*sqrt(22);

X11 = Y5(size(Y5)-22:size(Y5)-1);
X12 = Y5(size(Y5)-21:size(Y5));
R = (X12-X11)./X11;
S(5) = std(R);
W(5) = S(5)*sqrt(22);

X11 = Y6(size(Y6)-22:size(Y6)-1);
X12 = Y6(size(Y6)-21:size(Y6));
R = (X12-X11)./X11;
S(6) = std(R);
W(6) = S(6)*sqrt(22);

X11 = Y7(size(Y7)-22:size(Y7)-1);
X12 = Y7(size(Y7)-21:size(Y7));
R = (X12-X11)./X11;
S(7) = std(R);
W(7) = S(7)*sqrt(22);

X11 = Y8(size(Y8)-22:size(Y8)-1);
X12 = Y8(size(Y8)-21:size(Y8));
R = (X12-X11)./X11;
S(8) = std(R);
W(8) = S(8)*sqrt(22);

X11 = Y9(size(Y9)-22:size(Y9)-1);
X12 = Y9(size(Y9)-21:size(Y9));
R = (X12-X11)./X11;
S(9) = std(R);
W(9) = S(9)*sqrt(22);

X11 = Y10(size(Y10)-22:size(Y10)-1);
X12 = Y10(size(Y10)-21:size(Y10));
R = (X12-X11)./X11;
S(10) = std(R);
W(10) = S(10)*sqrt(22);


X11 = Z1(size(Z1)-22:size(Z1)-1);
X12 = Z1(size(Z1)-21:size(Z1));
R = (X12-X11)./X11;
S(10) = std(R);
T(1) = S(10)*sqrt(22);

X11 = Z2(size(Z2)-22:size(Z2)-1);
X12 = Z2(size(Z2)-21:size(Z2));
R = (X12-X11)./X11;
S(10) = std(R);
T(2) = S(10)*sqrt(22);
