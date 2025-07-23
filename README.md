# General_Docker_container

## Build docker images
First edit the .env file with your own credentials
On a terminal in VS code enter the following commands

### Ubuntu base

```bash
sudo docker compose build ubuntu-base
```

### sas base

```bash
sudo docker compose build sas-base
```

### Development container

```bash
sudo docker compose build sas-development
```


## How to grant access to USB and serial device on windows
* First install the st-link driver from ST-microelectronics [here](https://www.st.com/en/development-tools/stsw-link009.html#get-software)
* Install on you windows machine the usbipb utility. Open a Powershell as administrator and type the following command:
```
winget install dorssel.usbipd-win
```
* On WSL: 
    * Open a terminal
    ```
    sudo apt install linux-tools-generic hwdata
    sudo update-alternatives --install /usr/local/bin/usbip usbip /usr/lib/linux-tools/*-generic/usbip 20
    ```
* On Powershell
    * List the available device and identify your device id
    ```
    usbipd list
    ```
    * Bind your USB device to share it
    ```
    usbipd bind -b 2-2
    ```
    * Attach your USB device to WSL
    ```
    usbipd attach --wsl --busid 2-2
    ```

Now your device is ready to be used on WSL

