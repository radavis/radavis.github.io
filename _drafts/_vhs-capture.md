# VHS Capture

## Device

AVerMedia DVD EZMaker 7 (aka - AVerMedia C039 USB Pure Capture)

## w/ VLC

```
/Applications/VLC.app/Contents/MacOS/VLC -f "dshow://" \
  :dshow-vdev="AVerMedia C039 USB Pure Capture" \
  :dshow-adev=none \
  :dshow-aspect-ratio=16\:9 \
  :dshow-chroma= \
  :dshow-fps=0 \
  :dshow-tuner \
  :dshow-tuner-channel=0 \
  :dshow-tuner-frequency=0 \
  :dshow-tuner-country=0 \
  :dshow-tuner-standard=16 \
  :dshow-tuner-input=1 \
  :dshow-video-input=-1 \
  :dshow-video-output=-1 \
  :dshow-audio-input=-1 \
  :dshow-audio-output=-1 \
  :dshow-amtuner-mode=1 \
  :dshow-audio-channels=0 \
  :dshow-audio-samplerate=0 \
  :dshow-audio-bitspersample=0 \
  :dshow-size=720x576 \
  :live-caching=100
```
