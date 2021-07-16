# showosd

This little tool displays the native MacOS OSD via command line. Useful to embed in various scripts.

## Prerequisites

Install [XCode](https://developer.apple.com/xcode/)

## Installation

After downloading, to build, enter:

    make release

See the built app in the `.build/release` folder afterwards. Don't forget to install XCode beforehand!

## Usage examples:
            
`showosd` - Shows an empty OSD (with or without a value depending on last usage)

`showosd brightness 40` - Shows a brightness OSD at level 40 (out of 100)

`showosd volume 60` - Shows a volume OSD at level 60 (out of 100)

`showosd mute 0 primary` - Shows an OSD of muted symbol on the *primary display* only (normally defaults to all displays)

`showosd keylight lock` - Shows a locked keyboard birghtness symbol

`showosd volume` - Shows volume with the last set value

## Yamaha AV Control

Yamaha AV Control via Hammerspoon and the showosd tool

I originally made this tool for the following hammerspoon script which I use to control the volume of my Yamaha AV Receiver via from my Mac keyboard using the standard media keys and showing the standard mac Volume OSD:

https://gist.github.com/waydabber/3241fc146cef65131a42ce30e4b6eab7

## Thanks

Thanks to @alin23 for all the help!

Enjoy!
