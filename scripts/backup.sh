#!/bin/bash

# GitLab backup directory
backup_dir="/var/opt/gitlab/backups/"

# Create the backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
fi

# Backup GitLab and name the backup file with the current date and time
backup_file="$backup_dir$(date +%Y-%m-%d_%H-%M-%S)_gitlab_backup.tar"

gitlab-rake gitlab:backup:create BACKUP=$backup_file

# Keep only the 3 most recent backups and delete the rest
cd "$backup_dir"
ls -t | grep -v -E "$(ls -t | head -n 3 | sed 's/$/|/' | tr -d '\n')" | xargs rm -f

# Copy the newest backup file to another server via ssh key
remote_server="user@remote-server"
remote_backup_dir="/var/opt/gitlab/backups/"

newest_backup_file=$(ls -t | head -n 1)

scp -i /path/to/ssh/key "$backup_dir$newest_backup_file" "$remote_server:$remote_backup_dir"
