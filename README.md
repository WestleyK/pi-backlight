# Simple perl script for crude sleep mode/low power mode and for adjusting backlight

Designed and tested for raspberry pi with official 7 inch touchdcreen. <br>
<br>

## How to install, update, and uninstall:

### To install:

```
cd ~/
mkdir raspberrypi-backlight
cd raspberrypi-backlight/
git clone https://github.com/WestleyK/pi-backlight.git
cd pi-backlight/
sudo ./make.sh install
```
<br>

### Update:

Updating instructions coming soon!

```
nothing
```

<br>

### To uninstall:

```
sudo rm /usr/local/bin/pi-backlight
```

<br>
<br/>


## Usage:

<br>

```
pi@raspberrypi:~ $ pi-backlight -help
Usage: pi-backlight [option]
        -h | -help | --help (print help menu)
        [15-255] (adjust from: 15 to: 255)
        -u | -up (brighter by: 25)
        -d | -down (lower by: 25)
        -s | -sleep (enter sleep mode, press <ENTER> to exit this mode)
        -c (print currnt brightness, scale:[15-255])
        -n | -on (turns backlight on to: 200)
        -i | -info (print script info)
        -v | -version | --version (print version)
source code: https://github.com/WestleyK/pi-backlight 
pi@raspberrypi:~ $ 
```

<br>

Quick brightness adjust: <br>
`$ pi-backlight XXX` <br>
Where `XXX` is any whole number from `15` to `255`, for example: <br>
`$ pi-backlight 200` <br>
<br>
And of corse, sleep mode: <br>
`$ pi-backlight -s` <br>
Sleep mode will turn off the display backlight until you push \<ENTER\> <br>
<br>
You can also use the `-up` and `-down` option: <br>
`$ pi-backlight -u` Or: <br>
`$ pi-backlight -up` To adjust backlight highter, <br>
And to adjust backlight down: <br>
`$ pi-backlight -d` Or: <br>
`$ pi-backlight -down` To adjust backlight lower. <br>
<br>



<br>
Feel free to modify this :) <br>
Please let me know of any issues or feature requests! <br>
<br>

<br>

## End README

<br>
