#!/bin/bash

# Get the files to upload from the command line arguments
files="$@"

# Check if any files were provided
if [ -z "$files" ]; then
  echo "Error: Please specify files to upload."
  exit 1
fi

# Initialize a Git repository if it doesn't exist
if [ ! -d .git ]; then
  git init
fi

# Add the specified files to the staging area
git add $files

# Prompt for a commit message
read -p "Enter a commit message: " message

# Commit the changes with the provided message
git commit -m "$message"

# Set the remote repository URL (replace with your actual URL)
remote_url="https://github.com/username/repository.git"

# Add the remote repository if it doesn't exist
if ! git remote | grep -q origin; then
  git remote add origin "$remote_url"
fi

# Push the changes to the remote repository
git push origin master
