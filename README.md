# showosd

This little tool displays the native MacOS OSD via command line. Useful to embed in various scripts. I made it for this hammerspoon script which I use to control my Yamaha AV via from my Mac using the standard media keys:

https://gist.github.com/waydabber/3241fc146cef65131a42ce30e4b6eab7

---

After downloading, to build, enter:

make release

See the built app in the .build/release folder afterwards. Don't forget to install XCode beforehand!

---

Usage examples:
            
showosd - Shows an empty OSD (with or without a value depending on last usage)
showosd brightness 40 - shows a brightness OSD at level 40 (out of 100)
showosd volume 60 - shows a volume OSD at level 60 (out of 100)
showosd mute 0 primary - shows an OSD of muted symbol on the primary display only
showosd keylight lock - shows a locked keyboard birghtness symbol
showosd volume - shows volume with the last set value

---

Thanks to https://github.com/alin23 for all the help!
