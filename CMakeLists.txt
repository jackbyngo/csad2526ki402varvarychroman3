cmake_minimum_required(VERSION 3.14)
project(csad2526ki402varvarychroman3)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include FetchContent module
include(FetchContent)

# Fetch Google Test
FetchContent_Declare(
    gtest
    GIT_REPOSITORY https://github.com/google/googletest.git
    GIT_TAG v1.14.0
)

# Make sure to fetch Google Test
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(gtest)

# Add the main executable
add_executable(hello_world main.cpp)

# Add unit tests executable
add_executable(unit_tests tests/unit_tests.cpp math_operations.cpp)

# Link Google Test to the unit tests
target_link_libraries(unit_tests gtest gtest_main)

# Enable testing
enable_testing()

# Discover tests
include(GoogleTest)
add_test(NAME AllTests COMMAND $<TARGET_FILE:unit_tests>)