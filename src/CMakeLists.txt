if(ANDROID)
    add_executable(
        yo
        hello_wrapper.cpp
    )
    halide_use_image_io(yo)
    target_include_directories(
        yo
        PRIVATE
            ${HALIDE_INCLUDE_DIR}
            ${HALIDE_TOOLS_DIR}
            ${PROJECT_SOURCE_DIR}/gen_files/
    )
    target_link_libraries(yo PRIVATE ${PROJECT_SOURCE_DIR}/gen_files/hello.a android log)
else()
    halide_library(
        hello
        SRCS
            hello_generator.cpp
        GENERATOR_ARGS
            auto_schedule=false
    )

    add_executable(
        yo
        hello_wrapper.cpp
    )

    target_include_directories(
        yo
        PRIVATE
            ${HALIDE_INCLUDE_DIR}
            ${HALIDE_TOOLS_DIR}
    )
    target_link_libraries(yo PRIVATE hello pthread)
endif()

