#!/bin/bash
# capturenow.sh - Instantly capture Display 1 and sync it to the artifacts and workspace screenshots.

TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
FILENAME="kiwisdr_${TIMESTAMP}_manual_capture_mac.png"
ARTIFACT_DIR="/Users/jeffkerr/.gemini/antigravity-ide/brain/324311c3-95ab-445c-89c8-d9752ff3893c"
WORKSPACE_DIR="/Volumes/WORK 2TB/KIWI/screenshots"

mkdir -p "$WORKSPACE_DIR"

# Capture Display 1 (Right Acer screen)
screencapture -x -D 1 "$ARTIFACT_DIR/$FILENAME"

# Copy to workspace screenshots directory
cp "$ARTIFACT_DIR/$FILENAME" "$WORKSPACE_DIR/$FILENAME"

echo "Success: Captured to $WORKSPACE_DIR/$FILENAME"
echo "Artifact: $ARTIFACT_DIR/$FILENAME"
