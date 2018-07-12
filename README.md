# Simple perl script for adjusting backlight

Designed and tested for raspberry pi. <br>
<br>

## Install:

First download if you didn't already: <br>
`$ git clone https://github.com/WestleyK/pi-backlight.git` <br>
Then `cd` to `pi-backlight` and: <br>
`$ sudo ./install.sh` <br>
<br>
The full commands will look like this: <br>
```
git clone https://github.com/WestleyK/pi-backlight.git
cd pi-backlight/
sudo ./install.sh
```
<br>
<br>
To uninstall: <br>
`$ sudo ./install.sh -u` <br>
<br>


## Usage:

```
pi@raspberrypi:~ $ pi-backlight -h
Usage: pi-backlight [option]
        -h | -help | --help (print help menu)
        15-255 (adjust from 15 to 255)
        -s | -sleep (enter sleep mode)
        -d (print currnt brightness, scale:[15-255])
        -n | -on (turns backlight on to 200)
        -v | -version | --version (print version)
pi@raspberrypi:~ $  
```
<br>
Quick brightness adjust: <br>
`$ pi-backlight XXX` <br>
Where `XXX` is any whole number from 15 to 255, for example: <br>
`$ pi-backlight 200` <br>
<br>
And of corse, sleep mode: <br>
`$ pi-backlight -s` <br>
Sleep mode will turn off the display backlight until you push <ENTER> <br>
<br>

<br>
Feel free to modify this :) <br>
Any issues or feature request please let me know! <br>
<br>

<br>

### End README

<br>
