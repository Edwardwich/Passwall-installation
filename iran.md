# add iran to shunt:

1. Run opkg update:
  if get any error in useing this commend add dns to network interface and it work 
    ```sh
    opkg update
    ```
    ```sh
    opkg install wget-ssl
    ```
    ```sh
    wget -O geoip.dat https://github.com/chocolate4u/Iran-v2ray-rules/releases/latest/download/geoip.dat
    ```
    ```sh
    wget -O geosite.dat https://github.com/chocolate4u/Iran-v2ray-rules/releases/latest/download/geosite.dat
    ```
    ```sh
    mv geoip.dat /usr/share/v2ray/geoip_IR.dat
    ```
    ```sh
    mv geosite.dat /usr/share/v2ray/geosite_IR.dat
    ```

2.now go to passwall2 and go to Rule manage scrol down and 

  ![Screenshot 2024-12-19 at 14 51 46](https://github.com/user-attachments/assets/a5c23134-c657-4c62-bd52-6babaf69b801)

  add this to domain :
  ```sh
        regexp:.*\.ir$
regexp:.*\.xn--mgba3a4f16a$
ext:geosite_IR.dat:ir
```

  ![Screenshot 2024-12-19 at 14 52 59](https://github.com/user-attachments/assets/a70fb8c7-4656-4dcb-81be-1e706fada4f5)

  add this to IP:
  ```sh
    ext:geoip_IR.dat:ir
   ```
![Screenshot 2024-12-19 at 14 57 09](https://github.com/user-attachments/assets/0f5bfd41-f602-4461-b4c7-7e76167f0aa5)

than go to bsic setting and use shunt iran :
![Screenshot 2024-12-19 at 14 58 06](https://github.com/user-attachments/assets/ac61bff6-2f12-45ca-9dd8-c25e5ae8e849)

