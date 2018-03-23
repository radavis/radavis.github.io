---
layout: post
title: "Change the Default Screenshot Location in OS X"
date: 2016-07-22 12:00
tags: osx
comments: true
---

## Change Screenshot Location

```
$ defaults write com.apple.screencapture location ~/Dropbox/screenshots
$ killall SystemUIServer
```

## Screenshot Filename

Default: "Screen shot [short date] at [short time].[format]"

### Remove date

```
$ defaults write com.apple.screencapture "include-date" 0
```

### Change date format

System Preferences > Language & Region > Advanced > Dates, Times

## Change file type

```
$ defaults write com.apple.screencapture type [format]
```

**Options**:

  * bmp
  * pdf
  * jpg
  * jp2
  * tif
  * pict
  * tga
  * png

### OS X Defaults

```no-highlight
$ defaults
Command line interface to a user's defaults.
Syntax:

'defaults' [-currentHost | -host <hostname>] followed by one of the following:

  read                                 shows all defaults
  read <domain>                        shows defaults for given domain
  read <domain> <key>                  shows defaults for given domain, key

  read-type <domain> <key>             shows the type for the given domain, key

  write <domain> <domain_rep>          writes domain (overwrites existing)
  write <domain> <key> <value>         writes key for domain

  rename <domain> <old_key> <new_key>  renames old_key to new_key

  delete <domain>                      deletes domain
  delete <domain> <key>                deletes key in domain

  import <domain> <path to plist>      writes the plist at path to domain
  import <domain> -                    writes a plist from stdin to domain
  export <domain> <path to plist>      saves domain as a binary plist to path
  export <domain> -                    writes domain as an xml plist to stdout
  domains                              lists all domains
  find <word>                          lists all entries containing word
  help                                 print this help

<domain> is ( <domain_name> | -app <application_name> | -globalDomain )
         or a path to a file omitting the '.plist' extension

<value> is one of:
  <value_rep>
  -string <string_value>
  -data <hex_digits>
  -int[eger] <integer_value>
  -float  <floating-point_value>
  -bool[ean] (true | false | yes | no)
  -date <date_rep>
  -array <value1> <value2> ...
  -array-add <value1> <value2> ...
  -dict <key1> <value1> <key2> <value2> ...
  -dict-add <key1> <value1> ...
```

```no-highlight
$ defaults domains
com.apple.AddressBook
com.apple.AppleMultitouchMouse
com.apple.AppleMultitouchTrackpad
com.apple.Automator
com.apple.BezelServices
com.apple.CalendarAgent
com.apple.CloudPhotosConfiguration
com.apple.CommCenter.counts
com.apple.CoreGraphics
com.apple.FolderActionsDispatcher
com.apple.GEO
com.apple.HIToolbox
com.apple.Maps
com.apple.NetworkUtility
com.apple.ProblemReporter
com.apple.PubSubAgent
com.apple.QuickLookDaemon
com.apple.RemindersNC
com.apple.Safari
com.apple.ServicesMenu.Services
com.apple.SetupAssistant
com.apple.Spotlight
com.apple.SystemProfiler
com.apple.TelephonyUtilities
com.apple.Terminal
com.apple.UserAccountUpdater
com.apple.WebKit.WebContent
com.apple.accounts
com.apple.accountsd
com.apple.appstore
com.apple.archiveutility
com.apple.bookstoreagent
com.apple.calculateframework
com.apple.cloudpaird
com.apple.cloudphotosd
com.apple.commcenter.carrier_bundle
com.apple.commcenter.device_specific_nobackup
com.apple.commerce
com.apple.commerce.knownclients
com.apple.commerce.safari
com.apple.commerce.spotlight
com.apple.coreservices.uiagent
com.apple.coreservices.useractivityd.dynamicuseractivites
com.apple.dock
com.apple.driver.AppleBluetoothMultitouch.mouse
com.apple.driver.AppleBluetoothMultitouch.trackpad
com.apple.driver.AppleHIDMouse
com.apple.dt.xcodebuild
com.apple.facetime.bag
com.apple.finder
com.apple.helpd
com.apple.iCal
com.apple.iChat
com.apple.iChat.AIM
com.apple.iChat.Jabber
com.apple.iChat.Yahoo
com.apple.icloud.fmfd
com.apple.identityservicesd
com.apple.imessage.bag
com.apple.imservice.ids.FaceTime
com.apple.imservice.ids.iMessage
com.apple.ipTelephony
com.apple.loginitems
com.apple.loginwindow
com.apple.lookup
com.apple.mail
com.apple.messageshelper.AccountInfoController
com.apple.messageshelper.AlertsController
com.apple.metadata.SpotlightNetHelper
com.apple.ncplugin.weather
com.apple.notificationcenterui
com.apple.photolibraryd
com.apple.preferences.extensions.ServicesWithUI
com.apple.preferences.extensions.ShareMenu
com.apple.scheduler
com.apple.screensaver
com.apple.security.KCN
com.apple.security.cloudkeychainproxy3.keysToRegister
com.apple.sharingd
com.apple.sidebarlists
com.apple.spaces
com.apple.stocks
com.apple.suggestions
com.apple.symbolichotkeys
com.apple.systempreferences
com.apple.systemsound
com.apple.systemuiserver
com.apple.universalaccess
com.apple.wifi.keychain-format
com.apple.xpc.activity2
com.expressvpn.ExpressVPN
com.github.atom
com.google.Chrome
com.google.Keystone.Agent
com.googlecode.iterm2
com.kapeli.dashdoc
com.postgresapp.Postgres
com.qtproject
com.ragingmenace.MenuMeters
com.tinyspeck.slackmacgap
githubdocset
group.com.apple.TextReplacementService
loginwindow
nl.frim.GitX
org.gnome.gimp
org.openscad.OpenSCAD
org.shiftitapp.ShiftIt
pbs
```
