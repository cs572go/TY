#include <iostream>
#include <string>
#include <bitset>
#include <vector>

using namespace std;

int main()
{
    string str = "advait";
    vector<bitset<8>> block(2, bitset<8>());
    vector<bitset<8>> keys{bitset<8>(111), bitset<8>(222)};
    vector<bitset<8>> cipher;

    cout << str << endl;
    // encrypt
    for (int i = 0; i < str.size(); i += 2)
    {
        block.clear();
        block.push_back(bitset<8>(str[i]));
        block.push_back(bitset<8>(str[i + 1]));
        // cout<<block[0]<<" ";
        // cout<<block[1]<<" "<<endl;
        for (int j = 0; j < 2; j++)
        {
            bitset<8> ltmp;
            bitset<8> rtmp = block[1];
            bitset<8> tmp;

            ltmp = block[0] ^ (keys[j] ^ block[1]);
            // cout<<ltmp<<endl;

            swap(ltmp, block[1]);
            swap(block[0], rtmp);
            // cout<<block[0]<<" ";
            // cout<<block[1]<<" "<<endl;
            // cout<<"round end\n";
        }
        swap(block[0], block[1]);
        cipher.push_back(block[0]);
        cipher.push_back(block[1]);
        // cout<<block[0]<<" ";
        // cout<<block[1]<<" ";//<<endl;
        // cout<<"2 chars enc\n";
    }

    for (int i = 0; i != cipher.size(); i++)
    {
        cout << (char)(cipher[i].to_ulong());
    }
    cout << endl;
    // decrypt
    for (int i = 0; i < cipher.size(); i += 2)
    {
        block.clear();
        block.push_back(bitset<8>(cipher[i]));
        block.push_back(bitset<8>(cipher[i + 1]));
        for (int j = 1; j >= 0; j--)
        {
            bitset<8> ltmp;
            bitset<8> rtmp = block[1];
            bitset<8> tmp;

            ltmp = block[0] ^ (keys[j] ^ block[1]);

            swap(ltmp, block[1]);
            swap(block[0], rtmp);
        }
        swap(block[0], block[1]);
        cout << (char)(block[0].to_ulong()) << "";
        cout << (char)(block[1].to_ulong()) << "";
    }
    // cout<<"\nend";
    // cout<<block[0]<<endl;
    // block.push_back(bitset<8>(str[i]));

    return 0;
}