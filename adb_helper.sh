#!/bin/sh

function adb_ping() {
    ping -c 1 $1 > /dev/null 2>&1
    return $?
}

function adb_toggle_data() {
    local action=$1
    if [ "$action" = "off" ]; then
        # Tambahkan perintah yang sesuai untuk menonaktifkan data di OpenWRT
        echo "Menonaktifkan data (simulasi)"
    else
        # Tambahkan perintah yang sesuai untuk mengaktifkan data di OpenWRT
        echo "Mengaktifkan data (simulasi)"
    fi
}
