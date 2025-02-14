# Install Guide - AutoIP

## 📌 Prerequisites
Pastikan sistem Anda memiliki **Git** dan **Bash** yang sudah terinstal.

## 🚀 Instalasi dalam Satu Perintah
Jalankan perintah berikut untuk menginstal AutoIP secara otomatis:
```sh
git clone https://github.com/wachidbos97/autoip.git && cd autoip && \
mkdir helpers && mv adb_helper.sh helpers/ && \
chmod +x main.sh ping.sh logger.sh config.sh helpers/adb_helper.sh && \
sudo ln -s "$(pwd)/main.sh" /usr/bin/autoip && \
touch /tmp/openwrt-auto-ping.log && chmod 666 /tmp/openwrt-auto-ping.log
```

## 🎯 Menjalankan Program
Jalankan `autoip` dengan perintah berikut:
```sh
autoip
```

---

✅ **AutoIP siap digunakan!**

