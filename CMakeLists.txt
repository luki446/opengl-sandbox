cmake_minimum_required(VERSION 3.10)
project(opengl-sandbox)

if( CMAKE_BINARY_DIR STREQUAL CMAKE_SOURCE_DIR )
    message( FATAL_ERROR "Select other build directory for example build/" )
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Wpedantic")

set( CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin )

option(GLFW_BUILD_DOCS OFF)
option(GLFW_BUILD_EXAMPLES OFF)
option(GLFW_BUILD_TESTS OFF)

add_subdirectory(ext/glfw)

include_directories(ext/glfw/include/
                    ext/glad/include/)

file(GLOB GLAD_FILE ext/glad/src/glad.c)
file(GLOB PROJECT_FILES src/*.cpp)

add_definitions(-DGLFW_INCLUDE_NONE)

add_executable(${PROJECT_NAME} ${PROJECT_FILES} ${GLAD_FILE})

target_link_libraries(${PROJECT_NAME} glfw ${GLFW_LIBRARIES})