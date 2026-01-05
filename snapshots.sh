#!/bin/bash

btrfs subv snapshot /run/media/kanvolu/Backup /run/media/kanvolu/Backup/.snapshots/"$(date +%F)" || notify-send -a "BTRFS" "Snapshot creation for 'backup' failed"
btrfs subv snapshot /home /home/.snapshots/"$(date +%F)" || notify-send -a "BTRFS" "Snapshot creation for 'home' failed"
