# Passwall-installation

## Download-Passwall-Packages
First you need to check the Architecture
![Screenshot 2024-12-19 at 14 13 11](https://github.com/user-attachments/assets/6d72b366-efb1-4348-a93c-3f76ff291654)

then goo to this [passwall2](https://github.com/xiaorouji/openwrt-passwall2/releases/tag/24.12.19-1)
download this 2 Packages
![Screenshot 2024-12-19 at 14 16 15](https://github.com/user-attachments/assets/2d2ae492-ac15-4df3-8eee-7c13a004ac68)


## Install via OPKG

1. Run opkg update:

    ```sh
    opkg update
    ```

2. remove dnsmasq and install dnsmasq-full:

    ```sh
    opkg remove dnsmasq
    ```

    and

    ```sh
    opkg remove dnsmasq-full
    ```

3. Install package downloaded :
4. 
unzip all file downloaded and go to software in openwrt luci web interface and install Packages one by one 
![Screenshot 2024-12-19 at 14 23 48](https://github.com/user-attachments/assets/f6af2123-191c-451c-b9e5-1984c2aed519)

![Screenshot 2024-12-19 at 14 25 53](https://github.com/user-attachments/assets/581f806b-e40c-4351-b50c-d0d2c7172301)

![Screenshot 2024-12-19 at 14 26 31](https://github.com/user-attachments/assets/a501b675-ef53-4541-be17-efcccddfd8cf)

after installing all Packages now for last need install passwall2 frome software in openwrt luci web interface:
![Screenshot 2024-12-19 at 14 27 56](https://github.com/user-attachments/assets/55cba6a1-7cae-4996-b0a6-c00fbadbe3e4)

then log out frome luci web interface and log in again :
now u can find passwall2 in software tab in openwrt
![Screenshot 2024-12-19 at 14 29 36](https://github.com/user-attachments/assets/7426fa76-dfe9-47f5-9fec-06b005aa4b26)


