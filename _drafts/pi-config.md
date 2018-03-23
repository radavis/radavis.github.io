# Configuring Your Raspberry Pi

1. Write disk image
1. `touch ssh`
1. `touch wpa_supplicant.conf`

## wpa_supplicant.conf

```
country=US
ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1

network={
    ssid="your-ssid"
    scan_ssid=1
    psk="your-wifi-password"
    key_mgmt=WPA-PSK
}

network={
    ssid="another-ssid"
    scan_ssid=1
    psk="wifi-password"
    key_mgmt=WPA-PSK
}
```

## Notes

* Successfully connected to Pi and Pi to Wifi
* Requests to the outside network are unsuccessful
