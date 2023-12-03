#!/bin/bash

# Get the project name from the command-line argument or use "my_c_project" as default
project_name="${1:-my_c_project}"

mkdir "$project_name"
cd "$project_name"

# Create the .gitignore file
cat > .gitignore <<EOF
.vscode/*
!.vscode/c_cpp_properties.json
build/
EOF

# Create the CMakeLists.txt file
cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.0)
project($project_name C)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_STANDARD 11)

# Define the source file variable
set(SOURCE_FILES src/main.c)

# Create the executable target
add_executable($project_name \${SOURCE_FILES})
EOF

# Create the src directory with main.c
mkdir src
cat > src/main.c <<EOF
#include <stdio.h>

int main() {
    printf("Hello, $project_name!\\n");
    return 0;
}
EOF

mkdir build
mkdir .vscode
code .

exit 0
