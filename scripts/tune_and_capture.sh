#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
  echo "Usage: $0 <freq_kHz> <mode> <description>"
  echo "Example: $0 9805 am radiomarti"
  exit 1
fi

export FREQ=$1
export MODE=$2
export DESC=$3

browser-harness -c "
import os
import time
import subprocess
from datetime import datetime

freq = float(os.environ.get('FREQ', '9805'))
mode = os.environ.get('MODE', 'am')
desc = os.environ.get('DESC', 'unknown')

print(f'Tuning to {freq} kHz ({mode})...')
js(f'ext_tune({freq}, \"{mode}\", 0)')

print('Waiting 8 seconds for waterfall...')
time.sleep(8)

dbm = js('owrx.sMeter_dBm')
current_freq = js('ext_get_freq_kHz()')
print(f'Current frequency: {current_freq} kHz, S-meter: {dbm} dBm')

timestamp = datetime.now().strftime('%Y-%m-%d_%H-%M')
filename = f'kiwisdr_{timestamp}_{int(freq)}{mode}_{desc}_mac.png'

artifact_dir = '/Users/jeffkerr/.gemini/antigravity-ide/brain/324311c3-95ab-445c-89c8-d9752ff3893c'
artifact_path = os.path.join(artifact_dir, filename)

# Capture screen (Display 1)
print(f'Taking screenshot to {artifact_path}...')
subprocess.run(['screencapture', '-x', '-D', '1', artifact_path])

# Copy to workspace screenshots directory
workspace_screenshots_dir = '/Volumes/WORK 2TB/KIWI/screenshots'
workspace_path = os.path.join(workspace_screenshots_dir, filename)
print(f'Copying to {workspace_path}...')
subprocess.run(['cp', artifact_path, workspace_path])

print('Tuning and capture complete!')
"
