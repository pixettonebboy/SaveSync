#!/bin/bash

# === CONFIGURAZIONE ===
REMOTE_NAME="gdrive"
REMOTE_PATH="RetroArchSaves"
LOCAL_SAVE_DIR="$HOME/.config/retroarch/saves"
LOCAL_STATE_DIR="$HOME/.config/retroarch/states"
LOG_FILE="$HOME/retroarch-save-sync.log"

# === FUNZIONI ===

check_rclone() {
    if ! command -v rclone &> /dev/null; then
        echo "rclone non è installato. Installalo da https://rclone.org/" | tee -a "$LOG_FILE"
        exit 1
    fi
}

do_backup() {
    echo "🔁 Backup in corso..." | tee -a "$LOG_FILE"
    DATE=$(date '+%Y-%m-%d_%H-%M-%S')
    rclone sync "$LOCAL_SAVE_DIR" "$REMOTE_NAME:$REMOTE_PATH/saves" --create-empty-src-dirs --progress | tee -a "$LOG_FILE"
    rclone sync "$LOCAL_STATE_DIR" "$REMOTE_NAME:$REMOTE_PATH/states" --create-empty-src-dirs --progress | tee -a "$LOG_FILE"
    echo "Backup completato alle $DATE" | tee -a "$LOG_FILE"
}

do_restore() {
    echo "Ripristino dei salvataggi in corso..." | tee -a "$LOG_FILE"
    rclone sync "$REMOTE_NAME:$REMOTE_PATH/saves" "$LOCAL_SAVE_DIR" --progress | tee -a "$LOG_FILE"
    rclone sync "$REMOTE_NAME:$REMOTE_PATH/states" "$LOCAL_STATE_DIR" --progress | tee -a "$LOG_FILE"
    echo "Ripristino completato!" | tee -a "$LOG_FILE"
}

# === LOGICA ===

check_rclone

case "$1" in
    backup)
        do_backup
        ;;
    restore)
        do_restore
        ;;
    *)
        echo "Utilizzo: $0 {backup|restore}" | tee -a "$LOG_FILE"
        exit 1
        ;;
esac
