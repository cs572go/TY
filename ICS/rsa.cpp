#include <iostream>
#include <cmath>

using namespace std;

int main()
{
    double p = 3, q = 7;
    double n = p * q;
    double e = 5;
    double k = 2;

    double phin = (p - 1) * (q - 1);
    double d = ((k * phin) + 1) / e;

    cout << phin << endl;
    cout << d << endl;

    string hi = "hi";
    int data = 10;

    double encdata = pow(data, e);
    encdata = fmod(encdata, n);

    cout << encdata << endl;

    double decdata = (double)pow(encdata, d);
    decdata = fmod(decdata, n);
    cout << decdata << endl;

    return 0;
}