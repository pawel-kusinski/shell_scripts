#!/bin/bash

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
