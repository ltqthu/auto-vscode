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

filename=".vscode"

## mac
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Mac"
    ##############################
    # g++
    ##############################

    if [ "$TYPE" = "g++" ]; then

        if [ ! -d "$filename" ]; then
            mkdir "$filename"
        fi

        # 生成c_cpp_properties.json
        if [ ! -f "./$filename/c_cpp_properties.json" ]; then
            touch ./$filename/c_cpp_properties.json
            cat >./$filename/c_cpp_properties.json <<EOF
{
    "configurations": [
        {
            "name": "Linux",
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

        # 生成launch.json
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

        # 生成settings.json
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

        # 生成tasks.json
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
                "-lpthread",
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
        }
        
    ],
    "version": "2.0.0"
}
EOF
        fi

    fi

    ##############################
    # gcc
    ##############################

    if [ "$TYPE" = "gcc" ]; then

        if [ ! -d "$filename" ]; then
            mkdir "$filename"
        fi

        # 生成c_cpp_properties.json
        if [ ! -f "./$filename/c_cpp_properties.json" ]; then
            touch ./$filename/c_cpp_properties.json
            cat >./$filename/c_cpp_properties.json <<EOF
{
    "configurations": [
        {
            "name": "Linux",
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

        # 生成launch.json
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
            "name": "gcc调试",
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

        # 生成settings.json
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

        # 生成tasks.json
        if [ ! -f "./$filename/tasks.json" ]; then
            touch ./$filename/tasks.json
            cat >./$filename/tasks.json <<EOF
{
    "tasks": [
        {
            "type": "shell",
            "label": "C/C++: g++ build",
            "command": "/usr/bin/gcc",
            "args": [
                "-std=c99",
                "-g",
                "\${file}",
                "-o",
                "\${fileDirname}/\${fileBasenameNoExtension}",
                "-lpthread",
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
        }
        
    ],
    "version": "2.0.0"
}
EOF
        fi

    fi
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Linux"
elif [[ "$(expr substr $(uname -s) 1 10)"=="MINGW32_NT" ]]; then
    echo "Windows"
else
    echo "Others"
fi
