cmake_minimum_required(VERSION 2.8)
project(demo)

# 设置可调试
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g")

# 添加头文件
include_directories(include)

# 添加源文件
aux_source_directory(src SRC_LIST)

# 添加可执行文件
add_executable(auto-vscode ${SRC_LIST})

# 设置可执行文件输出路径
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/bin)
