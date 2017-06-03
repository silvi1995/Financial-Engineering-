#include<bits/stdc++.h>

using namespace std;
int main()
{
	FILE * fp = fopen("YAHOO.txt","r");
	FILE * fp1 = fopen("OUTPUT.txt","a");
	double close[50],returns[50],expectedReturn,stdDeviation,variance;
	expectedReturn = variance = 0;
	for(int i=0;i<50;i++)
		fscanf(fp,"%lf",&close[i]);
	for(int i=0;i<49;i++)
	{
		returns[i] = (close[i+1]-close[i])/(close[i]);
		expectedReturn += returns[i];
	}
	expectedReturn /= 49;
	for(int i=0;i<49;i++)
	{
		variance += (returns[i] - expectedReturn)*(returns[i] - expectedReturn);
	}
	variance /= 49;
	stdDeviation = sqrt(variance);
	cout<<expectedReturn<<" "<<stdDeviation<<endl;
	fprintf(fp1,"%lf %lf\n",expectedReturn,stdDeviation);
	fclose(fp1);
}
