# Install Guide - AutoIP

## 📌 Prerequisites
Pastikan sistem Anda memiliki **Git** dan **Bash** yang sudah terinstal.

## 🚀 Instalasi dalam Satu Perintah
Jalankan perintah berikut untuk menginstal AutoIP secara otomatis di `/usr/bin/autoip`:
```sh
git clone https://github.com/wachidbos97/autoip.git && cd autoip && \
sudo mkdir -p /usr/bin/autoip && sudo cp -r * /usr/bin/autoip/ && \
sudo mkdir /usr/bin/autoip/helpers && sudo mv /usr/bin/autoip/adb_helper.sh /usr/bin/autoip/helpers/ && \
sudo chmod +x /usr/bin/autoip/main.sh /usr/bin/autoip/ping.sh /usr/bin/autoip/logger.sh /usr/bin/autoip/config.sh /usr/bin/autoip/helpers/adb_helper.sh && \
sudo ln -s /usr/bin/autoip/main.sh /usr/bin/autoip && \
sudo touch /tmp/openwrt-auto-ping.log && sudo chmod 666 /tmp/openwrt-auto-ping.log
```

## 🎯 Menjalankan Program
Jalankan `autoip` dengan perintah berikut:
```sh
autoip
```

---

✅ **AutoIP siap digunakan!**

