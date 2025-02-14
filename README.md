# Panduan Instalasi autoip

## Persyaratan

Sebelum menginstal **autoip**, pastikan sistem Anda memenuhi persyaratan berikut:

- Sistem operasi berbasis Linux (disarankan OpenWRT atau Debian/Ubuntu)
- Paket **adb** terinstal jika digunakan untuk mengontrol perangkat Android
- Hak akses root (jika diperlukan)

## Instalasi

Jalankan perintah berikut untuk menginstal **autoip** secara otomatis:

```sh
sudo apt update && sudo apt install -y adb && git clone https://github.com/wachidbos97/autoip.git && sudo mkdir -p /usr/bin/autoip/helpers && sudo cp autoip/*.sh /usr/bin/autoip/ && sudo chmod +x /usr/bin/autoip/*.sh && sudo mv /usr/bin/autoip/adb_helper.sh /usr/bin/autoip/helpers/ && sudo chmod +x /usr/bin/autoip/helpers/adb_helper.sh && sudo chmod -R +x /usr/bin/autoip/ && sudo touch /tmp/openwrt-auto-ping.log && sudo chmod 666 /tmp/openwrt-auto-ping.log && echo 'export PATH=$PATH:/usr/bin/autoip' >> ~/.bashrc && source ~/.bashrc && sudo ln -s /usr/bin/autoip/main.sh /usr/bin/autoip
```

## Menjalankan autoip

Untuk menjalankan **autoip**, gunakan perintah berikut:

```sh
sh /usr/bin/autoip/main.sh
```

Atau jika shortcut telah dibuat:

```sh
autoip
```

## Konfigurasi

File konfigurasi disimpan di `config.sh`. Anda dapat mengubahnya dengan mengedit file secara manual atau melalui menu konfigurasi di skrip.

- **Menambah atau mengubah domain/IP yang dipantau**
- **Mengatur interval ping**
- **Mengubah threshold kegagalan ping sebelum mematikan data**

## Penghentian Program

Untuk menghentikan **autoip**, jalankan:

```sh
pkill -f main.sh
```

## Log

Log aktivitas dapat dilihat di:

```sh
cat /tmp/openwrt-auto-ping.log
```

## Uninstall

Jika ingin menghapus **autoip**, jalankan perintah berikut:

```sh
sudo rm -rf /usr/bin/autoip
```

