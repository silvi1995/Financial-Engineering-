#include<bits/stdc++.h>

using namespace std;

struct node
{
	double stock_val,max_val;
	node *left,*right;
};

double Getu(double sigma,double delt,double r)
{
	return exp(sigma*sqrt(delt)+(r-0.5*sigma*sigma)*delt);
}
double Getd(double sigma,double delt,double r)
{
	return exp(-sigma*sqrt(delt)+(r-0.5*sigma*sigma)*delt);
}
double Getpt(double u,double d,double r,double delt)
{
	return (exp(r*delt)-d)/(u-d);
}
node * ConstructTree(double Val,double MaxVal,double i,double M,double d,double u,vector<double> *payoff);
int main()
{
	FILE * fp = fopen("Lookback_Value.txt","w");	
	double S0,T,r,sigma,u,d,pt,qt,delt,M;
	vector<double> payoff;
	S0 = 100; T = 1; r = 0.08; sigma = 0.2;
	cout<<"Enter M\n";
	cin>>M;
	delt = T/M;
	u = Getu(sigma,delt,r);
	d = Getd(sigma,delt,r);
	pt = Getpt(u,d,r,delt);
	qt = 1-pt;
	int i = 0;
	node * root = ConstructTree(S0,S0,i,M,d,u,&payoff);
	int SIZE = payoff.size();
	for(int i=0;i<M;i++)
	{		
		for(int j=0;j<=pow(2,M-i)-1;j++)
			fprintf(fp,"%0.3lf ",payoff[j]);
		fprintf(fp,"\n");		
		for(int j=0;j<SIZE;j = j+2)
		{
			payoff[j/2] = exp(-r*delt) * (pt*payoff[j] + qt*payoff[j+1]);			
		}
		SIZE = SIZE/2;
	}
	fprintf(fp,"%0.3lf\n",payoff[0]);
	cout<<payoff[0];
}
node * ConstructTree(double Val,double MaxVal,double i,double M,double d,double u,vector<double>*payoff)
{
	if(i == M+1)
		return NULL;
	node * temp = new node;
	temp->stock_val = Val;
	temp->max_val = max(Val,MaxVal);
	if(i == M)
	{
		if(temp->max_val - temp->stock_val > 0)
			(*payoff).push_back(temp->max_val-temp->stock_val);
		else
			(*payoff).push_back(0);
	}
	temp->left = ConstructTree(Val*d,temp->max_val,i+1,M,d,u,payoff);
	temp->right = ConstructTree(Val*u,temp->max_val,i+1,M,d,u,payoff);
	return temp;
}
