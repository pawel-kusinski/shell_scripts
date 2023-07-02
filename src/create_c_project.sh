#!/bin/bash

# MIT License

# Copyright (c) 2023 Pawel Kusinski

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Get the project name from the command-line argument or use "my_project" as default
project_name="${1:-my_project}"

# Create the project directory
mkdir "$project_name"
cd "$project_name"

# Create the CMakeLists.txt file
cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.0)
project($project_name C)

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
    printf("Hello, world!\\n");
    return 0;
}
EOF

# Create the build directory with an empty ".keep" file
mkdir build
touch build/.keep

# Create the .vscode directory
mkdir .vscode

# Exit the script
exit 0
