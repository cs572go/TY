#include <iostream>
#include <vector>
#include <cmath>
using namespace std;
string railfenceenc(string text, int d)
{
    string result = "";
    vector<vector<string>> mat(d, vector<string>(ceil(text.length() / float(d)), ""));
    for (int i = 0; i < text.length(); i++)
    {
        mat[i % d][floor(i / float(d))] = text[i];
    }

    for (int i = 0; i < d; i++)
    {
        for (int j = 0; j < ceil(text.length() / float(d)); j++)
        {
            result += mat[i][j];
        }
    }
    cout << result;
    return result;
}

string railfencedec(string text, int d)
{
    cout << text;
    string result = "";
    vector<vector<string>> mat(d, vector<string>(ceil(text.length() / float(d)), ""));
    cout << text;
    for (int i = 0; i < text.length(); i++)
    {
        mat[floor(i / float(d))][i % d] = text[i];
    }
    cout << endl;
    for (int i = 0; i < d; i++)
    {
        for (int j = 0; j < ceil(text.length() / float(d)); j++)
        {
            result += mat[i][j];
            cout << mat[i][j];
        }
        cout << "\n";
    }
    return result;
}
// string monoalphadec(string text, int odd,int even)
// {
//     string result = "";
//     for (int i=0;i<text.length();i++)
//     {
//         if(i%2==0)
//         {
//             if (isupper(text[i]))
//                 result += char(int(text[i]-even-65)%26 +65);
//             else
//                 result += char(int(text[i]-even-97)%26 +97);
//         }
//         else
//         {
//             if (isupper(text[i]))
//                 result += char(int(text[i]-odd-65)%26 +65);
//             else
//                 result += char(int(text[i]-odd-97)%26 +97);
//         }
//     }

//     return result;
// }

int main()
{
    string text = "abcdefghijkl";
    int d = 3;
    string cipher = "";
    cout << "Text : " << text;
    cout << "\nDepth: " << d << endl;
    cipher = railfenceenc(text, d);
    cout << "ujgvds";
    cout << "\nCipher: " << railfenceenc(text, d) << endl;
    cout << "wtf";
    cout << "\nUnencrypted: " << railfencedec(cipher, d);
    return 0;
}