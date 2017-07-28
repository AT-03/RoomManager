#!/bin/sh

echo "Running pre-commit hook, to run with out do 'git commit -n'"

  bundle exec rake ci:rubocop_changed


