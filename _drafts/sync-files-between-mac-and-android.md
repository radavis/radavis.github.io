# Sync files between Mac and Android

Sync files between Mac and connected device.

On Macs, we can execute a script when a folder changes. This means, we can
attach a script to the file add action, such as any changes to the `/Volumes`
folder.


## Flow

* Watch `/Volumes` for changes
* When a specific volume appears, run a command (e.g. - `adb push --sync`)

Variables

* File location one
* File location two

## Show all files

```
# Show hidden files & folders in finder
$ defaults write com.apple.finder AppleShowAllFiles TRUE ;killall Finder

# Normal display. Hide hidden files & folders in finder
$ defaults write com.apple.finder AppleShowAllFiles FALSE ;killall Finder
```

Right click on the /Volumes/ folder, configure folder actions.

Right click on the /Volumes/ folder, attach folder action.

Your script will get invoked for anytime something is added to /Volumes. Write you script so it ignores all folders but the one you are looking for.

Mac OS add a folder to /Volumes every time a device is added to your system to /Volumes
