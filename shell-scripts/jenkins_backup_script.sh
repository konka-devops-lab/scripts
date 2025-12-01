#!/bin/bash

set -e

# ====== CONFIGURATION ======
JENKINS_HOME="/jenkins_data"
S3_BUCKET="s3://ullagalliu-artifacts/jenkins_folder/"
BACKUP_DIR="/tmp"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/jenkins-backup-$TIMESTAMP.tar.gz"
# ============================

echo "Creating Jenkins backup..."

# Create compressed backup
tar -czf "$BACKUP_FILE" "$JENKINS_HOME"

echo "Backup created at: $BACKUP_FILE"

# Upload to S3
echo "Uploading backup to S3..."
aws s3 cp "$BACKUP_FILE" "$S3_BUCKET/"

echo "Backup uploaded to S3 successfully."

# Clean up
rm -f "$BACKUP_FILE"

echo "Backup process completed."
