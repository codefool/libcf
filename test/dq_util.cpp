#include <iostream>
#include "../include/libcf.h"

struct Data
{
    int a;
    int b;
};

int main(int argc, char **argv)
{
    libcf::DiskQueue dq("/tmp", "testqueue", sizeof(Data));
    Data d;
    for(int j(0); j < 1024 * 1024; j++)
    {
        for(int i(0); i < 20; i++)
        {
            d.a = j * 100 + i;
            d.b = d.a * 2;
            dq.push((const libcf::dq_data_t)&d);
        }
        dq.pop((libcf::dq_data_t)&d);
        std::cout << d.a << ' ' << d.b << std::endl;
    }
    while( dq.pop((libcf::dq_data_t)&d) )
        std::cout << d.a << ' ' << d.b << std::endl;
    return 0;
}