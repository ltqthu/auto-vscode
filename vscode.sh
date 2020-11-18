#!/bin/bash

TYPE=$1
if [ "$TYPE" != "g++" ] && [ "$TYPE" != "gcc" ] && [ "$TYPE" != "cmake" ]; then
    echo Usage:
    echo $'\t'vscode g++
    echo $'\t'vscode gcc
    echo $'\t'vscode cmake
    exit
fi
TYPE=$1
CurrentFilename=${PWD##*/}
filename=".vscode"

mkdir_vscode() {
    if [ ! -d "$filename" ]; then
        mkdir "$filename"
    fi
}

create_linux_c_cpp_properties_json() {
    if [ ! -f "./$filename/c_cpp_properties.json" ]; then
        touch ./$filename/c_cpp_properties.json
        cat >./$filename/c_cpp_properties.json <<EOF
{
    "configurations": [
        {
            "name": "Linux",
            "includePath": [
                "\${workspaceFolder}/**",
                "/usr/include",
                "/usr/local/include",
                "/usr/lib/gcc/x86_64-redhat-linux/4.8.5/include",
                "/usr/include/c++/4.8.5/backward",
                "/usr/include/c++/4.8.5/x86_64-redhat-linux",
                "/usr/include/c++/4.8.5"
            ],
            "defines": [],
            "compilerPath": "/usr/bin/gcc",
            "cStandard": "c11",
            "cppStandard": "c++11",
            "intelliSenseMode": "gcc-x64"
        }
    ],
    "version": 4
}
EOF
    fi
}

create_mac_c_cpp_properties_json() {
    if [ ! -f "./$filename/c_cpp_properties.json" ]; then
        touch ./$filename/c_cpp_properties.json
        cat >./$filename/c_cpp_properties.json <<EOF
{
    "configurations": [
        {
            "name": "Mac",
            "includePath": [
                "\${workspaceFolder}/**",
                "/usr/local/include",
                "/Library/Developer/CommandLineTools/usr/bin/../include/c++/v1",
                "/Library/Developer/CommandLineTools/usr/lib/clang/11.0.0/include",
                "/Library/Developer/CommandLineTools/usr/include",
                "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"
            ],
            "defines": [],
            "compilerPath": "/usr/bin/gcc",
            "cStandard": "c11",
            "cppStandard": "c++11",
            "intelliSenseMode": "gcc-x64"
        }
    ],
    "version": 4
}
EOF
    fi
}

create_mac_gcc_launch_json() {
    if [ ! -f "./$filename/launch.json" ]; then
        touch ./$filename/launch.json
        cat >./$filename/launch.json <<EOF
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "g++调试",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${fileDirname}/\${fileBasenameNoExtension}",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "lldb",
            "preLaunchTask": "C/C++: g++ build",
            "postDebugTask": "C/C++: g++ clean",
        }
    ]
}
EOF
    fi
}

create_linux_gcc_launch_json() {
    if [ ! -f "./$filename/launch.json" ]; then
        touch ./$filename/launch.json
        cat >./$filename/launch.json <<EOF
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "g++调试",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${fileDirname}/\${fileBasenameNoExtension}",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "lldb",
            "preLaunchTask": "C/C++: g++ build",
            "postDebugTask": "C/C++: g++ clean",
        }
    ]
}
EOF
    fi
}

create_mac_cmake_launch_json() {
    if [ ! -f "./$filename/launch.json" ]; then
        touch ./$filename/launch.json
        cat >./$filename/launch.json <<EOF
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "cmake调试",
            "type": "cppdbg",
            "request": "launch",
            "program": "${fileDirname}/bin/\${fileBasenameNoExtension}",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "lldb",
            "preLaunchTask": "C/C++: cmake build",
            "postDebugTask": "C/C++: cmake clean",
        }
    ]
}
EOF
    fi
}

create_linux_cmake_launch_json() {
    if [ ! -f "./$filename/launch.json" ]; then
        touch ./$filename/launch.json
        cat >./$filename/launch.json <<EOF
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "cmake调试",
            "type": "cppdbg",
            "request": "launch",
            "program": "${fileDirname}/bin/\${fileBasenameNoExtension}",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "preLaunchTask": "C/C++: cmake build",
            "postDebugTask": "C/C++: cmake clean",
        }
    ]
}
EOF
    fi
}

create_gcc_settings_json() {
    if [ ! -f "./$filename/settings.json" ]; then
        touch ./$filename/settings.json
        cat >./$filename/settings.json <<EOF
{
    "cmake.configureOnOpen": false,
    "files.associations": {
        "*.tcc": "cpp",
        "streambuf": "cpp",
        "string": "cpp",
        "array": "cpp",
        "cctype": "cpp",
        "clocale": "cpp",
        "cmath": "cpp",
        "cstdarg": "cpp",
        "cstdint": "cpp",
        "cstdio": "cpp",
        "cstdlib": "cpp",
        "cstring": "cpp",
        "ctime": "cpp",
        "cwchar": "cpp",
        "cwctype": "cpp",
        "deque": "cpp",
        "list": "cpp",
        "unordered_map": "cpp",
        "vector": "cpp",
        "exception": "cpp",
        "fstream": "cpp",
        "functional": "cpp",
        "initializer_list": "cpp",
        "iosfwd": "cpp",
        "iostream": "cpp",
        "istream": "cpp",
        "limits": "cpp",
        "new": "cpp",
        "ostream": "cpp",
        "numeric": "cpp",
        "sstream": "cpp",
        "stdexcept": "cpp",
        "cinttypes": "cpp",
        "tuple": "cpp",
        "type_traits": "cpp",
        "utility": "cpp",
        "typeinfo": "cpp"
    },
    "C_Cpp.clang_format_sortIncludes": true, // 格式化时调整include的顺序（按字母排序）
}
EOF
    fi
}

create_mac_tasks_json() {
    if [ ! -f "./$filename/tasks.json" ]; then
        touch ./$filename/tasks.json
        cat >./$filename/tasks.json <<EOF
{
    "tasks": [
        {
            "type": "shell",
            "label": "C/C++: g++ build",
            "command": "/usr/bin/g++",
            "args": [
                "-std=c++11",
                "-g",
                "\${file}",
                "-o",
                "\${fileDirname}/\${fileBasenameNoExtension}",
                "&&",
                "clear",
                "&&",
                "\${fileDirname}/\${fileBasenameNoExtension}",
            ],
            "options": {
                "cwd": "\${workspaceFolder}"
            },
            "problemMatcher": [
                "\$gcc"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": false,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "clear": true,
                "showReuseMessage": false
            }
        },
        {
            "type": "shell",
            "label": "C/C++: g++ clean",
            "command": "rm",
            "args": [
                "-rf",
                "\${fileDirname}/\${fileBasenameNoExtension}.dSYM",
                "&&",
                "rm",
                "-rf",
                "\${fileDirname}/\${fileBasenameNoExtension}",
            ],
            "options": {
                "cwd": "\${workspaceFolder}"
            },
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": false,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": false
            },
        },
        {
            "type": "shell",
            "label": "C/C++: cmake build",
            "command": "cd ./build; cmake ../; make; clear; ./../bin/$CurrentFilename; ",
            "options": {
                "cwd": "\${workspaceFolder}"
            },
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": false,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": false
            },
        },
        {
            "type": "shell",
            "label": "C/C++: cmake clean",
            "command": "rm",
            "args": [
                "-rf",
                "./build/*",
            ],
            "options": {
                "cwd": "\${workspaceFolder}"
            },
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": false,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": false
            },
        }
    ],
    "version": "2.0.0"
}
EOF
    fi
}

create_linux_tasks_json() {
    if [ ! -f "./$filename/tasks.json" ]; then
        touch ./$filename/tasks.json
        cat >./$filename/tasks.json <<EOF
{
    "tasks": [
        {
            "type": "shell",
            "label": "C/C++: g++ build",
            "command": "/usr/bin/g++",
            "args": [
                "-std=c++11",
                "-g",
                "\${file}",
                "-o",
                "\${fileDirname}/\${fileBasenameNoExtension}",
                "&&",
                "clear",
                "&&",
                "\${fileDirname}/\${fileBasenameNoExtension}",
            ],
            "options": {
                "cwd": "\${workspaceFolder}"
            },
            "problemMatcher": [
                "\$gcc"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": false,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "clear": true,
                "showReuseMessage": false
            }
        },
        {
            "type": "shell",
            "label": "C/C++: g++ clean",
            "command": "rm",
            "args": [
                "-rf",
                "\${fileDirname}/\${fileBasenameNoExtension}.dSYM",
                "&&",
                "rm",
                "-rf",
                "\${fileDirname}/\${fileBasenameNoExtension}",
            ],
            "options": {
                "cwd": "\${workspaceFolder}"
            },
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": false,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": false
            },
        },
        {
            "type": "shell",
            "label": "C/C++: cmake build",
            //"command": "cd ./build; cmake ..; make; ./../bin/\${fileBasenameNoExtension}; ",
            "command": "cd ./build; cmake ..; make; ",
            "options": {
                "cwd": "\${workspaceFolder}"
            },
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": false,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": false
            },
        },
        {
            "type": "shell",
            "label": "C/C++: cmake clean",
            "command": "${fileDirname}/bin/${fileBasenameNoExtension}",
            "args": [
                "&&",
                "rm",
                "-rf",
                "./build/*",
            ],
            "options": {
                "cwd": "\${workspaceFolder}"
            },
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "presentation": {
                "echo": false,
                "reveal": "always",
                "focus": false,
                "panel": "shared",
                "showReuseMessage": false
            },
        }
    ],
    "version": "2.0.0"
}
EOF
    fi
}

create_mac_cmake_launch_json() {
    if [ ! -f "./$filename/launch.json" ]; then
        touch ./$filename/launch.json
        cat >./$filename/launch.json <<EOF
{
    // 使用 IntelliSense 了解相关属性。 
    // 悬停以查看现有属性的描述。
    // 欲了解更多信息，请访问: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations": [
        {
            "name": "cmake调试",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${fileDirname}/bin/\${fileBasenameNoExtension}",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "lldb",
            "preLaunchTask": "C/C++: cmake build",
            "postDebugTask": "C/C++: cmake clean",
        }
    ]
}
EOF
    fi
}

create_cmake_demo() {
    if [ ! -d "./bin" ]; then
        mkdir "./bin"
    fi
    if [ ! -d "./include" ]; then
        mkdir "./include"
    fi
    if [ ! -d "./src" ]; then
        mkdir "./src"
    fi
    if [ ! -d "./build" ]; then
        mkdir "./build"
    fi
    if [ ! -f "./include/Header.h" ]; then
        touch ./include/Header.h
        cat >./include/Header.h <<EOF
#include <iostream>
using namespace std;

class Demo {
public:
    Demo();
    ~Demo();
};
EOF
    fi

    if [ ! -f "./src/Header.cpp" ]; then
        touch ./src/Header.cpp
        cat >./src/Header.cpp <<EOF
#include "Header.h"

Demo::Demo() {
    cout << "Demo()" << endl;
}

Demo::~Demo() {
    cout << "~Demo()" << endl;
}
EOF
    fi

    if [ ! -f "./CMakeLists.txt" ]; then
        touch ./CMakeLists.txt
        cat >./CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 2.8)
project($CurrentFilename)

# 设置可调试
set(CMAKE_CXX_FLAGS "\${CMAKE_CXX_FLAGS} -Wall -lpthread -g -std=c++11")

# 添加头文件
include_directories(include)

# 添加源文件
aux_source_directory(src SRC_LIST)
aux_source_directory(./ SRC_LIST)

# 添加可执行文件
add_executable($CurrentFilename \${SRC_LIST})

# 设置可执行文件输出路径
set(EXECUTABLE_OUTPUT_PATH \${PROJECT_SOURCE_DIR}/bin)
EOF
    fi

    if [ ! -f "./$CurrentFilename.cpp" ]; then
        touch ./$CurrentFilename.cpp
        cat >./$CurrentFilename.cpp <<EOF
#include "Header.h"

int main() {
    Demo demo;

    return 0;
}
EOF
    fi

}

## mac
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Mac"

    # 创建vscode目录
    mkdir_vscode
    # 生成c_cpp_properties.json
    create_mac_c_cpp_properties_json
    # 生成tasks.json
    create_mac_tasks_json
    # 生成settings.json
    create_gcc_settings_json

    ##############################
    # g++
    ##############################
    if [ "$TYPE" = "g++" ]; then
        # 生成launch.json
        create_mac_gcc_launch_json
    fi

    ##############################
    # gcc
    ##############################
    if [ "$TYPE" = "gcc" ]; then
        # 生成launch.json
        create_mac_gcc_launch_json
    fi

    ##############################
    # cmake
    ##############################
    if [ "$TYPE" = "cmake" ]; then
        # 生成launch.json
        create_mac_cmake_launch_json
        create_cmake_demo
    fi

elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Linux"

    # 创建vscode目录
    mkdir_vscode
    # 生成c_cpp_properties.json
    create_linux_c_cpp_properties_json
    # 生成tasks.json
    create_linux_tasks_json
    # 生成settings.json
    create_gcc_settings_json

    ##############################
    # g++
    ##############################
    if [ "$TYPE" = "g++" ]; then
        # 生成launch.json
        create_linux_gcc_launch_json
    fi

    ##############################
    # gcc
    ##############################
    if [ "$TYPE" = "gcc" ]; then
        # 生成launch.json
        create_linux_gcc_launch_json
    fi

    ##############################
    # cmake
    ##############################
    if [ "$TYPE" = "cmake" ]; then
        # 生成launch.json
        create_linux_cmake_launch_json
        create_cmake_demo
    fi

elif [[ "$(expr substr $(uname -s) 1 10)"=="MINGW32_NT" ]]; then
    echo "Windows"
else
    echo "Others"
fi
