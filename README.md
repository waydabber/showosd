# showosd

This little tool displays the native MacOS OSD via command line. Useful to embed in various scripts.

## Prerequisites

Install [XCode](https://developer.apple.com/xcode/)

## Installation

After downloading, to build, enter:

    make release

See the built app in the `.build/release` folder afterwards. Don't forget to install XCode beforehand!

## Usage examples:
            
`showosd` - Shows an empty OSD (not very useful)

`showosd brightness 40` - Shows brightness OSD at level 40 (out of 100)

`showosd volume 60` - Shows volume OSD at level 60 (out of 100)

`showosd volume` - Shows volume with the last set value

`showosd volume 4 16` - Volume OSD as 4 chiclets full out of the total possible 16

`showosd brightness 15 64` - Shows voume OSD as 3 and 3/4 chiclets full

`showosd mute 0 primary` - Shows volume muted symbol on the primary display only

`showosd keylight lock` - Shows a locked keyboard birghtness symbol

`showosd eject` - Eject

`showosd link` - Shows link icon

`showosd sleep` - Shows a sleep icon and then initiates sleep ..zZz

## Example use in a script

Check out the following [hammerspoon](https://github.com/Hammerspoon/hammerspoon) script. 

This script allows you to control the volume of your external Display's brightness, contrast and volume via DDC (if you use an M1 mac) using [m1ddc](https://github.com/waydabber/m1ddc) and also control your Yamaha AV Receiver through network. The script listens to the standard Apple keyboard media keys and shows the standard macOS Birghtness and Volume OSDs via uses [showosd](https://github.com/waydabber/showosd) :

https://gist.github.com/waydabber/3241fc146cef65131a42ce30e4b6eab7

## Thanks

Thanks to [@alin23](https://github.com/alin23) for all the help!

Enjoy!
