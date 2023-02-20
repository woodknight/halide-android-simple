add_halide_generator(hello.generator hello_generator.cpp)
add_halide_library(hello FROM hello.generator)

add_executable(main main.cpp)
target_link_libraries(main PRIVATE hello Halide::Tools)
if(ANDROID)
    target_link_libraries(main PRIVATE log)
endif()