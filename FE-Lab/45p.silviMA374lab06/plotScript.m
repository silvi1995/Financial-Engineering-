b1 = load('ABBIndiaLtd.txt');
b2 = load('ACCLtd.txt');
b3 = load('AdaniPortsAndSpecialEconomicZone.txt');
b4 = load('AmbujaCementsLtd.txt');
b5 = load('AshokLeylandLtd.txt');
b6 = load('AsianPaintsLtd.txt');
b7 = load('AurobindoPharmaLtd.txt');
b8 = load('AxisBankLtd.txt');
b9 = load('BankOfBaroda.txt');
b10 = load('BankOfIndia.txt');

o1 = load('AdityaBirlaNuvoLtd.txt');
o2 = load('Alphabet.txt'); 
o3 = load('Amazon.txt');
o4 = load('Danone.txt');
o5 = load('DollarGeneralCorporation.txt');
o6 = load('Facebook.txt');
o7 = load('HessCorporation.txt');
o8 = load('LibertyLilacGroup.txt');
o9 = load('MTNL.txt');
o10 = load('TajHotels.txt');

n1 = load('ApolloHospitals.txt');
n2 = load('Bosch.txt');

a = n2(1:30:size(n2,1)-1);
b = n2(31:30:size(n2,1));
c = min(size(a,1),size(b,1));
a = a(1:c);
b = b(1:c);
m = log(b./a);
m = (m-mean(m))/std(m);
x = -5:.1:5;
norm = normpdf(x,0,1);
[h,b] = hist(m,20);
h = h/sum(abs(b(2) - b(1))*h);
bar(b,h,'histc');
line(x,norm);
title('Bosch_MonthlyLog');
