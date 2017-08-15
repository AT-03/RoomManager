# Author: Daniel Cabero
# !/bin/sh
echo "Running pre-commit hook, to run with out do 'git commit -n'"
rake ci: rubocop_changed
