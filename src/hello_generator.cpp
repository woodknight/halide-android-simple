#include "Halide.h"

namespace
{
using namespace Halide;

class Hello : public Generator<Hello>
{
public:
    Input<Buffer<uint8_t>> input{"input", 2};
    Output<Buffer<uint8_t>> output{"output", 2};

    void generate()
    {
        Var x("x"), y("y");
        output(x, y) = cast<uint8_t>(input(x, y) * 2);
    }

};

} // namespace

HALIDE_REGISTER_GENERATOR(Hello, hello)