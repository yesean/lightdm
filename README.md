# eh8's Litarvan's LightDM WebKit2 theme

![](demo.png)

## General tips
1. Make sure you have node and npm on your machine. Run ```npm i``` prior to ```install.sh``` to install npm dependencies. This step is generally only necessary for first-time setup.
1. The theme pulls ```~/Pictures/Wallpapers/background.png``` to the ```/usr/share/backgrounds``` folder. You can disable this functionality by uncommenting the respective lines in ```install.sh```
1. To attain the same settings as the unixporn post, you'll need to disable the splash text and enable rounded avatars.

### I have multiple desktop environments and want to select one at login
Uncomment line 36 in ```src/views/Login.vue``` to turn on DE selection. I only use Xfce so I removed this functionality since it was unnecessary for me.
