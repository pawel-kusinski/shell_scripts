#!/bin/bash

# Get the project name from the command-line argument or use "my_webpage_project" as default
project_name="${1:-my_webpage_project}"

mkdir "$project_name"
cd "$project_name"
mkdir .vscode
mkdir src

cat > src/index.html <<EOF
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>$project_name</title>
    <script src="script.js"></script>
  </head>
  <body>
    <h1>$project_name</h1>
  </body>
</html>
EOF

touch src/style.css
touch src/script.js
code .
exit 0
