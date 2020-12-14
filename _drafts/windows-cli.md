# Windows CLI

## Install scoop

[[source](https://github.com/lukesampson/scoop#installation)]

Open PowerShell: Win+r, type "powershell"

```no-highlight
C:\Users\username> Set-ExecutionPolicy RemoteSigned -scope CurrentUser
C:\Users\username> iwr -useb get.scoop.sh | iex
C:\Users\username> scoop install git
C:\Users\username> scoop bucket add extras
C:\Users\username> scoop help
Usage: scoop <command> [<args>]

Some useful commands are:

alias       Manage scoop aliases
bucket      Manage Scoop buckets
cache       Show or clear the download cache
checkup     Check for potential problems
cleanup     Cleanup apps by removing old versions
config      Get or set configuration values
create      Create a custom app manifest
depends     List dependencies for an app
export      Exports (an importable) list of installed apps
help        Show help for a command
hold        Hold an app to disable updates
home        Opens the app homepage
info        Display information about an app
install     Install apps
list        List installed apps
prefix      Returns the path to the specified app
reset       Reset an app to resolve conflicts
search      Search available apps
status      Show status and check for new app versions
unhold      Unhold an app to enable updates
uninstall   Uninstall an app
update      Update apps, or Scoop itself
virustotal  Look for app's hash on virustotal.com
which       Locate a shim/executable (similar to 'which' on Linux)


Type 'scoop help <command>' to get help for a specific command.
```

## Backup Android Device with adb

[Enable debugging on your device](https://developer.android.com/studio/command-line/adb#Enabling)

```no-highlight
C:\Users\username> scoop install adb
C:\Users\username> adb kill-server
C:\Users\username> adb start-server
C:\Users\username> adb devices -l
C:\Users\username> adb backup -apk -shared -all -f 20201024-android-device-backup.ab
```

## Install Java

```no-highlight
C:\Users\username> scoop bucket add java
C:\Users\username> scoop search jdk
C:\Users\username> scoop install openjdk15
```
