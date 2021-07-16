import Cocoa
import Foundation

var helptext: String = """
Usage examples:
            
showosd - Shows an empty OSD (not very useful)
showosd brightness 40 - Shows brightness OSD at level 40 (out of 100)
showosd volume 60 - Shows volume OSD at level 60 (out of 100)
showosd volume - Shows volume with the last set value
showosd volume 4 16 - Volume OSD as 4 chiclets full out of the total possible 16
showosd brightness 15 64 - Shows voume OSD as 3 and 3/4 chiclets full
showosd mute 0 primary - Shows volume muted symbol on the primary display only
showosd keylight lock - Shows a locked keyboard birghtness symbol
showosd eject - Eject
showosd link - Shows link icon
showosd sleep - Shows a sleep icon and then initiates sleep ..zZz

"""

var displayCount: UInt32 = 0
var onlineDisplays = [CGDirectDisplayID](repeating: 0, count: Int(16))
let err = CGGetOnlineDisplayList(16, &onlineDisplays, &displayCount)
let displayIDs = onlineDisplays.prefix(Int(displayCount))
var osdImage: Int64 = 0
var value: UInt32 = 50
var outof: UInt32 = 100
var locked: Bool = false
var novalue: Bool = true
var primary: Bool = false
var i: Int = 0

for argument in CommandLine.arguments {

    switch argument {

        case "brightness":          osdImage = 1
        case "volume":              osdImage = 3
        case "volumedisable":       osdImage = 22
        case "mute":                osdImage = 4
        case "mutedisable":         osdImage = 21
        case "nokeylight":          osdImage = 12
        case "nokeylightdisable":   osdImage = 14
        case "keylight":            osdImage = 11
        case "keylightdisable":     osdImage = 13
        case "nowifi":              osdImage = 9
        case "eject":               osdImage = 6
        case "sleep":               osdImage = 20
        case "link":                osdImage = 19
        case "panel":               osdImage = 15

        case "lock":                locked = true
        case "primary":             primary = true
            
        case "help", "?", "--help", "-h":
                        
        print(helptext)
        exit(0)
            
        default:
           
        if let intValue = Int(argument) {

            if (i==0) {

                value=UInt32(intValue)
                novalue = false
                i=1
                
            } else {
                
                outof=UInt32(intValue)
                
            }
        }
           
    }
    
}

i=0

for id in displayIDs {

    i=i+1; if ((primary && i > 1) && primary) { exit(0) }
        
    if let manager = OSDManager.sharedManager() as? OSDManager {
    
        if (novalue && !locked) {
        
            manager.showImage(
                osdImage,
                onDisplayID: id,
                priority: 0x1F4,
                msecUntilFade: 1500
            )
        
        } else {

            manager.showImage(
                osdImage,
                onDisplayID: id,
                priority: 0x1F4,
                msecUntilFade: 1500,
                filledChiclets: value,
                totalChiclets: outof,
                locked: locked
            )
        
        }
        
    }
        
}
