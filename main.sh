#!/bin/sh

# Tentukan jalur dasar di mana skrip dan file konfigurasi berada
BASE_DIR="/usr/bin/autoip"

# Memuat fungsi dan konfigurasi menggunakan jalur absolut
source "$BASE_DIR/config.sh"
source "$BASE_DIR/logger.sh"

function start_program() {
    logger "Program mulai"
    sh "$BASE_DIR/ping.sh" &
    PING_PID=$!
    wait $PING_PID
    logger "Program berhenti"
}

function stop_program() {
    if [ -n "$PING_PID" ]; then
        kill $PING_PID
        logger "Program dihentikan"
        unset PING_PID
    else
        echo "Program tidak berjalan."
    fi
}

function configure_program() {
    read -p "Masukkan domain/IP (pisahkan dengan spasi): " -a new_domains
    read -p "Masukkan interval ping (dalam detik): " new_interval

    # Menyimpan konfigurasi ke file
    save_configuration "${new_domains[@]}" $new_interval
}

function save_configuration() {
    local domains=("$@")
    local interval=${domains[-1]}
    unset domains[-1]

    echo "DOMAINS=(${domains[@]})" > "$BASE_DIR/config.sh"
    echo "PING_INTERVAL=$interval" >> "$BASE_DIR/config.sh"
    echo "PING_FAILURE_THRESHOLD=$PING_FAILURE_THRESHOLD" >> "$BASE_DIR/config.sh"

    echo "Konfigurasi telah disimpan!"
}

function view_logs() {
    echo "Menampilkan log (tekan 'q' untuk keluar):"
    less +F /tmp/openwrt-auto-ping.log
    echo "Kembali ke menu utama..."
}

function display_status() {
    echo "=== Status Program ==="
    if [ -n "$PING_PID" ]; then
        echo "Status: Berjalan"
    else
        echo "Status: Tidak Berjalan"
    fi
    echo "Domains/IPs yang dipantau: ${DOMAINS[*]}"
    echo "Interval ping: $PING_INTERVAL detik"
    echo "Threshold kegagalan ping: $PING_FAILURE_THRESHOLD"
}

function display_menu() {
    echo "=== Menu ==="
    echo "1. Start Program"
    echo "2. Stop Program"
    echo "3. Konfigurasi"
    echo "4. Lihat Log"
    echo "5. Status Program"
    echo "6. Keluar"
    read -p "Pilih opsi: " choice
    case $choice in
        1) start_program ;;
        2) stop_program ;;
        3) configure_program ;;
        4) view_logs ;;
        5) display_status ;;
        6) exit 0 ;;
        *) echo "Opsi tidak valid!" ;;
    esac
}

while true; do
    display_menu
done
