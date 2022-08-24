#include <iostream>
using namespace std;
string caesar(string text, int s)
{
    string result = "";
    for (int i = 0; i < text.length(); i++)
    {
        if (isupper(text[i]))
            result += char(int(text[i] + s - 65) % 26 + 65);
        else
            result += char(int(text[i] + s - 97) % 26 + 97);
    }

    return result;
}

string uncaesar(string text, int s)
{
    string result = "";
    for (int i = 0; i < text.length(); i++)
    {
        if (isupper(text[i]))
            result += char(int(text[i] - s - 65) % 26 + 65);
        else
            result += char(int(text[i] - s - 97) % 26 + 97);
    }

    return result;
}

int main()
{
    string text = "ATTACKATONCE";
    string cipher = "";
    int s = 4;
    cout << "Text : " << text;
    cout << "\nShift: " << s;
    cipher = caesar(text, s);
    cout << "\nCipher: " << cipher;
    cout << "\nUnencrypted: " << uncaesar(cipher, s);
    return 0;
}