#include <iostream>

#include "hello.h"
#include "HalideBuffer.h"
#include "halide_benchmark.h"

using namespace Halide::Runtime;

int main()
{
    uint8_t data[4] = {1, 2, 3, 4};

    Buffer<uint8_t> input(data, 2, 2);
    Buffer<uint8_t> output(2, 2);

    double best_time = Halide::Tools::benchmark([&](){
        hello(input, output);
        output.device_sync();
    });

    std::cout << "process time: " << best_time * 1e3 << "ms" << std::endl;

    for(int i = 0; i < 2; i++)
    {
        for(int j = 0; j < 2; j++)
        {
            std::cout << int(output(i, j)) << " ";
        }
        std::cout << "\n";
    }

    return 0;
}

