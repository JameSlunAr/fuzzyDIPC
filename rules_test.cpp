#include<bits/stdc++.h>
using namespace std;

int i1, i2, i3, i4, i5, i6, n;

int main()
{
	// ofstream cout("output_test.txt");
	n=3;
	for (i1=1; i1<=n; i1++)
		for (i2=1; i2<=n; i2++)
			for (i3=1; i3<=n; i3++)
				for (i4=1; i4<=n; i4++)
					for (i5=1; i5<=n; i5++)
						for (i6=1; i6<=n; i6++)
							cout << i1 << ' ' << i2 << ' ' << i3 << ' ' << i4 << ' ' << i5 << ' ' << i6 
						<< ", " << i1 << ' ' << i2 << ' ' << i3 << ' ' << i4 << ' ' << i5 << ' ' << i6 
						<< " (1) : 1" << '\n';
	return 0;
} 