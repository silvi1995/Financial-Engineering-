
stock1 = load('ABBIndiaLtd.txt');
stock2 = load('ACCLtd.txt');
stock3 = load('AdaniPortsAndSpecialEconomicZone.txt');
stock4 = load('AdityaBirlaNuvoLtd.txt');
stock5 = load('Alphabet.txt');
stock6 = load('Amazon.txt');
stock7 = load('AmbujaCementsLtd.txt');
stock8 = load('ApolloHospitals.txt');
stock9 = load('AshokLeylandLtd.txt');
stock10 = load('AsianPaintsLtd.txt');


len = 270;
s1 = load('AurobindoPharmaLtd.txt'); s1 = s1(1:len,:);
s2 = load('AxisBankLtd.txt'); s2 = s2(1:len,:);
s3 = load('BankOfBaroda.txt'); s3 = s3(1:len,:);
s4 = load('BankOfIndia.txt'); s4 = s4(1:len,:);
s5 = load('Bosch.txt'); s5 = s5(1:len,:);
s6 = load('Danone.txt'); s6 = s6(1:len,:);
s7 = load('DollarGeneralCorporation.txt'); s7 = s7(1:len,:);
s8 = load('Facebook.txt'); s8 = s8(1:len,:);
s9 = load('HessCorporation.txt'); s9 = s9(1:len,:);
s10 = load('TajHotels.txt'); s10 = s10(1:len,:);

s11 = load('MTNL.txt'); s11 = s11(1:len,:);


names = char('ABBIndiaLtd_Volatility' , 'ACCLLtd_Volatility' , 'AdaniPorts_Volatility' , 'AdityaBirla_Volatility' , 'Alphabet_Volatility' , 'Amazon_Volatility' , 'Ambuja_Volatility' , 'Apollo_Volatility' , 'Ashok_Volatility' , 'AsianPaints_Volatility', 'Auro_Volatility' , 'Axis_Volatility' , 'BOB_Volatility' , 'BOI_Volatility' , 'Bosch_Volatility' , 'Danone_Volatility' , 'Dollar_Volatility' , 'FB_Volatility' , 'HESS_Volatility' , 'TAJ_Volatility','MTNL_Volatility');





l = 270;
v = 1;
stock1 = stock1(1:v:l,:);
stock2 = stock2(1:v:l,:);
stock3 = stock3(1:v:l,:);
stock4 = stock4(1:v:l,:);
stock5 = stock5(1:v:l,:);
stock6 = stock6(1:v:l,:);
stock7 = stock7(1:v:l,:);
stock8 = stock8(1:v:l,:);
stock9 = stock9(1:v:l,:);
stock10 = stock10(1:l,:);

s1 = s1(1:v:l,:);
s2 = s2(1:v:l,:);
s3 = s3(1:v:l,:);
s4 = s4(1:v:l,:);
s5 = s5(1:v:l,:);
s6 = s6(1:v:l,:);
s7 = s7(1:v:l,:);
s8 = s8(1:v:l,:);
s9 = s9(1:v:l,:);
s10 = s10(1:v:l,:);
s11 = s11(1:v:l,:);

STOCK = [];
STOCK(:,1) = stock1(1:l,:);
STOCK(:,2) = stock2(1:l,:);
STOCK(:,3) = stock3(1:l,:);
STOCK(:,4) = stock3(1:l,:);
STOCK(:,5) = stock6(1:l,:);
STOCK(:,6) = stock6(1:l,:);
STOCK(:,7) = stock7(1:l,:);
STOCK(:,8) = stock8(1:l,:);
STOCK(:,9) = stock9(1:l,:);
STOCK(:,10) = stock10(1:l,:);
STOCK(:,11) = s1(1:l,:);
STOCK(:,12) = s2(1:l,:);
STOCK(:,13) = s3(1:l,:);
STOCK(:,14) = s4(1:l,:);
STOCK(:,15) = s5(1:l,:);
STOCK(:,16) = s6(1:l,:);
STOCK(:,17) = s7(1:l,:);
STOCK(:,18) = s8(1:l,:);
STOCK(:,19) = s9(1:l,:);
STOCK(:,20) = s10(1:l,:);
STOCK(:,21) = s11(1:l,:);


for s = 1:21


stock = STOCK(:,s);
r = size(stock,1);

vols = [];
months = [];

for i=1:12
	stockTemp = stock(r-(i*22):r,:);
	vols(i) = sqrt(var(stockTemp))*sqrt(12*22);
	months(i) = i;
end

plot(months,vols,'b');
xlabel('Months');
ylabel('Historial Volatility');
title(names(s,:));
print(names(s,:),'-dpng');
hold off;

end


