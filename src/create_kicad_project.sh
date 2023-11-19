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

# Creates a folder structure for KiCad projects

# Get the project name from the command-line argument or use "my_kicad_project" as the default
project_name="${1:-my_kicad_project}"

# Create the project directory
mkdir "$project_name"
cd "$project_name"

# Create the .gitignore file
cat > .gitignore <<EOF
# For PCBs designed using KiCad: https://www.kicad.org/
# Format documentation: https://kicad.org/help/file-formats/

# Temporary files
*.000
*.bak
*.bck
*.kicad_pcb-bak
*.kicad_sch-bak
*.kicad_sch.lck
*.kicad_pcb.lck
*-backups
*.kicad_prl
*.sch-bak
*~
_autosave-*
*.tmp
*-save.pro
*-save.kicad_pcb
fp-info-cache
\#auto_saved_files\#

# Netlist files (exported from Eeschema)
*.net

# Autorouter files (exported from Pcbnew)
*.dsn
*.ses

# Exported BOM files
*.xml
*.csv
EOF

# Create the README.md file
cat > README.md <<EOF
# $project_name
Write something about this project here.
EOF

# Create directory structure
mkdir fabrication_outputs
touch fabrication_outputs/.gitkeep

mkdir images
touch images/.gitkeep

# When creating a new project, save it in this directory.
# Make sure to uncheck "Create a new folder for the project" option.
mkdir KiCad
touch KiCad/.gitkeep

exit 0
