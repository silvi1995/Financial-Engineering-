#include<bits/stdc++.h>

using namespace std;

double Getu(double sigma,double r,double delt)
{
	return exp((sigma*sqrt(delt)) + ((((r*delt)-(0.5*sigma*sigma)))*delt));
}

double Getd(double sigma,double r,double delt)
{
	return exp(-(sigma*sqrt(delt)) + ((((r*delt)-(0.5*sigma*sigma)))*delt));
}

double GetpTilde(double delt,double r,double u,double d)
{
	return (exp(r*delt)-d)/(u-d);
}
int main()
{
	FILE *fp = fopen("Put_Price_At_t.txt","w");
	int choice;
	double S0,K,T,r,sigma,u,d,pt,qt,delt,ans;
	//step gives the step number for the values of t given in the problem .
	int step[] = { 2, 5, 10,18};
	double M = 20;
	double S[401],payoff[401];

	cout<<"Enter the values of S(0),K,T,r and sigma"<<endl;
	cin>>S0>>K>>T>>r>>sigma;

	cout<<"Enter 1 for European call and 0 for European put"<<endl;
	cin>>choice;

	delt = T/M;

	u = Getu(sigma,r,delt);
	d = Getd(sigma,r,delt);

	//Check arbitrage
	if(d > 0 && d < exp(r*delt) && exp(r*delt) < u)
		cout<<"No arbitrage"<<endl;
	else
	{
		cout<<"Arbitrage"<<endl;
		return 0;
	}

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
    else if(choice == 0)
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

	int k = 3;
	int flag = 0;
	for(int i=0;i<M;i++)
	{
		if(k >= 0 && (step[k] == M-i-1))
		{
			flag = 1;
			k--;
			fprintf(fp,"%lf ",(double)(M-i-1)*delt);
		}
		for(int j=0;j<M-i;j++)
		{
			payoff[j] = exp(-r*delt)*(pt*payoff[j] + qt*payoff[j+1]);
			if(flag == 1)
			{

				fprintf(fp,"%.3lf ",payoff[j]);
			}
		}
		if(flag == 1)
			fprintf(fp,"\n");
		flag = 0;
	}
	fprintf(fp,"0 %.3lf\n",payoff[0]);
}
