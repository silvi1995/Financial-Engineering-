#include<bits/stdc++.h>

using namespace std;

double Getu(double sigma,double r,double delt)
{
	return exp((sigma*sqrt(delt)) + (((r-(0.5*sigma*sigma)))*delt));
}
double Getd(double sigma,double r,double delt)
{
	return exp(-(sigma*sqrt(delt)) + (((r-(0.5*sigma*sigma)))*delt));
}
double GetpTilde(double delt,double r,double u,double d)
{
	return (exp(r*delt)-d)/(u-d);
}
bool NoArbitrage(double u,double d,double r,double delt)
{
    if(d > 0 && d < exp(r*delt) && exp(r*delt) < u)
        return 1;
    else return 0;
}
double GetPrice(double S0,double K, double T,double r,double M,double sigma,double choice);
int main()
{
	FILE *fp = fopen("American_Call_Vary_S0.txt","w");
	char variation;
	double S0,K,T,r,sigma,M,temp,choice;

	S0 = 100; K = 100; T = 1; r = 0.08; sigma = 0.2; M = 100;

	cout<<"\nEnter choice :\n 1 - American Call \n 2 - American put"<<endl;
	cin>>choice;
	
	cout<<"\n-------Enter for variation--------"<<endl;
	cout<<"\na - S(0)\nb - K\nc - r\nd - sigma\ne - M\n"<<endl;
	cin>>variation;

    if(variation == 'a')
    {
        for(double i=S0;i<=1000;i++)
        {
            fprintf(fp,"%.0lf %.3lf\n",i,GetPrice(i,K,T,r,M,sigma,choice));
        }
    }
    if(variation == 'b')
    {
        for(double i=K;i<=200;i=i+0.02)
        {
            fprintf(fp,"%.3lf %.3lf\n",i,GetPrice(S0,i,T,r,M,sigma,choice));
        }
    }
    if(variation == 'c')
    {
        for(double i=r;i<=2;i=i+0.02)
        {
            temp = GetPrice(S0,K,T,i,M,sigma,choice);
            if(temp != -1)
                fprintf(fp,"%.3lf %.3lf\n",i,temp);
        }
    }
    if(variation == 'd')
    {
        for(double i=sigma;i<=2;i=i+0.01)
        {
            temp = GetPrice(S0,K,T,r,M,i,choice);
            if(temp != -1)
                fprintf(fp,"%.3lf %.3lf\n",i,temp);
        }
    }
    if(variation == 'e')
    {
        for(double i=M;i<=400;i++)
        {
            temp = GetPrice(S0,K,T,r,i,sigma,choice);
            if(temp != -1)
                fprintf(fp,"%.0lf %.3lf\n",i,temp);
        }
    }
    fclose(fp);
}
double GetPrice(double S0,double K, double T,double r,double M,double sigma,double choice)
{
     double delt,u,d,pt,qt,t1,t2;
     double S[401],payoff[401];
     delt = T/M;

    u = Getu(sigma,r,delt);
    d = Getd(sigma,r,delt);

    if(!NoArbitrage(u,d,r,delt))
        return -1;
    else
        cout<<"No Arbitrage\n";

    pt = GetpTilde(delt,r,u,d);
    qt = 1 - pt;

    if(choice == 1)
    {
	for(int i=0;i<=M;i++)
	    {
		S[i] = pow(u,M-i)*pow(d,i)*S0;
		if((S[i]-K) > 0)
		   payoff[i] = S[i]-K;
		else
		   payoff[i] = 0;
	    }
    }
    if(choice == 2)
    {
	for(int i=0;i<=M;i++)
	    {
		S[i] = pow(u,M-i)*pow(d,i)*S0;
		if((K-S[i]) > 0)
		   payoff[i] = K-S[i];
		else
		   payoff[i] = 0;
	    }
    }

    for(int i=0;i<M;i++)
    {
        for(int j=0;j<M-i;j++)
        {
            t1 = exp(-r*delt)*(pt*payoff[j] + qt*payoff[j+1]);
	    if(choice == 1)
		t2 = (pow(u,M-i-1-j)*pow(d,j)*S0) - K; 
	    if(choice == 2)
	    	t2 = K - (pow(u,M-i-1-j)*pow(d,j)*S0);               
            payoff[j] = max(t1,t2);
        }
    }
    return payoff[0];
}



