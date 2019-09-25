# MacBook Pro 2018 Display Troubleshooting

Display flickers/glitches after X minutes of use.

Question: Is this problem observed within a specific application? (e.g. -
  only in Chrome, or system-wide?)

## Disable GPU Rasterization

[This questionable website](https://pdf.wondershare.com/macos-10-14/fix-screen-flickers-on-macos-10-14.html#1)
suggests that you disable GPU rasterization for a particular app by...

* Navigating to an installed app's folder from the command line: `cd /Applications/App Name.app/Contents/MacOS`
* Execute the app `./<App Name>` with a `--disable-gpu-rasterization` flag.

The `--disable-gpu-rasterization` flag seems to be a common trait for
chrome-based/electron apps (e.g. - Slack & Atom).

[tonymacx86 - Chrome graphics issues](https://www.tonymacx86.com/threads/fix-chrome-graphics-issues-but-without-turning-off-graphics-acceleration.221328/)

### in Chrome

[source](https://www.lifewire.com/hardware-acceleration-in-chrome-4125122)

* View Chrome GPU Settings: <chrome://gpu>

```
open -a "Google Chrome" --args --disable-gpu --disable-gpu-rasterization
```

### in Atom

```
atom --disable-gpu &
```

## Reset SMC

[Instructions](https://support.apple.com/en-us/HT201295)
