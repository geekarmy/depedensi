#!/bin/bash

# Direktori tempat menyimpan backup
backup_dir="$HOME/backup-db"
username="your_username"
password="your_password"

# Nama file backup dengan timestamp
backup_file="$backup_dir/db_backup_$(date +'%Y%m%d_%H%M%S').sql"

# Membuat backup semua database
mysqldump -u "$username" -p"$password" --all-databases > "$backup_file"

# Menghapus file backup yang lebih lama dari 1 bulan
find "$backup_dir" -type f -name 'db_backup_*' -mtime +30 -exec rm {} \;
