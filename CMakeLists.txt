cmake_minimum_required(VERSION 3.5)
project(greenspace)

enable_language(C CXX OBJC OBJCXX)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 11)

# Option to switch between a system and vendored libraries.
option(GREENSPACE_VENDORED "Use vendored libraries" ON)

if(GREENSPACE_VENDORED)
    add_subdirectory(libs/SDL EXCLUDE_FROM_ALL)
else()
    # 1. Look for a SDL3 package,
    # 2. look for the SDL3-shared component, and
    # 3. fail if the shared component cannot be found.
    find_package(SDL3 REQUIRED CONFIG REQUIRED COMPONENTS SDL3-shared)
endif()

if(GREENSPACE_VENDORED)
    add_subdirectory(libs/GLFW EXCLUDE_FROM_ALL)
else()
    find_package(glfw3 REQUIRED)
endif()

include_directories(SYSTEM libs/glad/include)

# Create game executable.
add_executable(greenspace src/main.cc libs/glad/src/glad.c)

target_link_libraries(greenspace PRIVATE SDL3::SDL3)
target_link_libraries(greenspace PRIVATE glfw)
