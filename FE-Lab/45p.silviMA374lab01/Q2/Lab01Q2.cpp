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
	FILE *fp = fopen("M_Step5_Put_Price.txt","w");
	int choice;
	double S0,K,T,r,sigma,u,d,pt,qt,delt,ans;
	double M = 1;
	double S[401],payoff[401];

	cout<<"Enter the values of S(0),K,T,r and sigma"<<endl;
	cin>>S0>>K>>T>>r>>sigma;

	cout<<"Enter 1 for European call and 0 for European put"<<endl;
	cin>>choice;

	while(M <= 400)
	{
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

		for(int i=0;i<M;i++)
		{
			for(int j=0;j<M-i;j++)
			{
				payoff[j] = exp(-r*delt)*(pt*payoff[j] + qt*payoff[j+1]);
			}
		}
		cout<<"For M :"<<M<<" "<<"Price :"<<payoff[0]<<endl;
		fprintf(fp,"%.0lf %lf\n",M,payoff[0]);
		M += 5;
	}
}
