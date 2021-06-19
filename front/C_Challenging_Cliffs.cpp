/*
Author: Pratik Bedre
*/
#include <iostream>
#include <vector>
#include <queue>
#include <set>
#include <algorithm>
using namespace std;
#define x first
#define y second
#define all(v) v.begin(), v.end()
#define minh(Type) priority_queue<Type, vector<Type>, greater<Type>>
#define maxh(Type) priority_queue<Type>
typedef long long ll;
template <typename T, typename Y>
bool operator<(pair<T, Y> a, pair<T, Y> b)
{
    if (a.x != b.x)
        return a.x < b.x;
    return a.y < b.y;
}
template <typename t>
void sort(t a)
{
    sort(all(a));
}
void solve()
{
    vector<int>
}
int main()
{
    int t;
    cin >> t;
    for (int i = 0; i < t; i++)
        solve();
    return 0;
}
