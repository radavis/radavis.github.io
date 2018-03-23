---
layout: post
title: "Notes on USB"
date: 2016-03-14 12:00
tags: usb
---

## Universal Serial Bus

A General Overview...

* A specification developed by Compaq, Intel, Microsoft, NEC, HP, Lucent, and Philips (USB Implementers Forum).
* Goals:
  - replace serial, parallel, ps/2, joystick, midi; all legacy ports.
  - no user knowledge necessary to install device.
  - correct driver software automatically used
* Speeds
  - low: 1.5 Mbit/s
  - full: 12 Mbit/s
  - high: 480 Mbit/s (USB v2)

## Architecture

* "tiered star topology" - single host controller, maximum of 127 connected devices connected to the host.
* 7-bit address field, address 0 reserved
* 6 tiers, max (hubs connected to hubs)
* 5m max cable length

## Host Controller

* initiates communication with devices
* communication occurs from device to host, not device to device
* device cannot initiate communication, unless put into a 'suspend' state by the host.
* host controller interfaces:
  - OHCI - Open Host Controller Interface (hardware-oriented controller)
  - UHCI - Universal HCI (Intel's software-oriented controller USB v1/1.1)
  - EHCI - Extended HCI (single standard for OHCI and UHCI)

## On-The-Go

* device as a USB host controller.

## Electrical Specification

* shielded cable w/ 4 wires
  - VBUS (+5V)
  - D+
  - D-
  - GND
* bus-powered device
  - draws power from the host
  - 100mA max
  - 500mA max, if permitted by the host
  - 0.5mA max, if suspended
  - 2.5mA max, if suspended + remote wakeup enabled

## Data Flow

* only one device can talk at a time (shared bus)
* data flows from the host to all devices connected to a hub, but is ignored by only the device with the correct address
* intermediate hubs act as repeaters

## Setting Speed

* 1.5Kohm pull-up resistor between _ and 3.3V:
  - D+: High Speed Device
  - D-: Low Speed Device
* Host observes which line is pulled high and sets speed accordingly.

## Line States (D+ and D-)

* Detached: both lines are low.
* Attached/Idle: D+ or D- goes high, other is low. Host observes a device has been plugged in.
* [NRZI encoding](https://en.wikipedia.org/wiki/Non-return-to-zero#Non-return-to-zero_inverted)

## Packets

* LSB first
* SYNC bits - DATA bits - EOP (End Of Packet)
* Types:
  - token
  - data
  - handshake
  - special
* Transaction: consists of three packets (token, data, handshake)

## Data Flow

* Control Tx - used for command or status operations
* Bulk Tx - consume maximum bandwidth, not time-critical
* Interrupt Tx - device requesting action from host
* Isochronous Tx - used to carry time-critical data (eg- video, audio)

## Protocol

### Start up

1. Device is plugged in
2. Host detects device via pull-up resistor (high/low speed device)
3. Host signals device to reset
4. Device resets and then responds to Address 0
5. Host queries device for maximum packet size via `Get Descriptor` command
6. Host resets device
7. Host sends `Set Address` command
8. Host queries device for descriptors (device, configuration, string)
9. Host loads device driver
10. Device is ready for use

### Configurations, Interfaces, Endpoints

These define the features of a device, as well as how to interact with it.

* One configuration loaded at a time, first config is loaded by default
* One or more interfaces, each has a number of endpoints
* Endpoint is a source or sink for data
  - up to 16 endpoints on high-speed devices
  - up to 3 endpoints on low-speed devices

Example: VOIP Phone
  - one audio interface, two audio endpoints
  - hid interface, single input endpoint for keypad

## Device Identification

A device can be uniquely identified via its Vendor ID and Product ID.

## libusb

"An open source library that allows you to communicate with USB devices from userspace."

Facilitates communication between client software and device endpoints via pipes.

### Pipes

* message - used for control transfers
* stream - used for interrupt, isochronous, and bulk transfers

### Synchronous and Asynchronous I/O

#### Logical Representation

Host reading data from an endpoint:
  1. Host sends request for data
  2. Host receives incoming data

Host writing data from an endpoint:
  1. Host sends data to device endpoint
  2. Host receives acknowledgment

There may be an indefinite delay between these two steps.

Synchronous (blocking I/O) - Perform a USB transfer with via a single function call. Both steps are combined.
Asynchronous (non-blocking I/O) - Separate logical steps. Callback function handles step 2.

### Devices and Interfaces

* Interact with a device through a `libusb_device` object
* one `libusb_dev_handle` per interface on a device

#### Working with a Device via libusb

1. `libusb_init` creates a session
2. `libusb_get_device_list` enumerates all connected devices
3. loop through devices
4. open a device with `libusb_open` or `libusb_open_device_with_vid_pid`
5. clear device list by calling `libusb_free_device_list`
6. call `libusb_claim_interface`
7. perform desired I/O
8. release device via `libusb_release_interface`
9. close device via `libusb_close`
10. close session via `libusb_exit`

#### Detach from Kernel

If the OS has connected to the device, you cannot claim it.

1. `libusb_detach_kernel_driver`
2. `libusb_kernel_driver_active` => 1/0

## List USB Devices in OS X

```
system_profiler SPUSBDataType
```

## Ruby and libusb

Ruby [libusb](https://github.com/larskanis/libusb) implementation.

```
brew install libusb
gem install libusb  # or add to Gemfile
```

### Tx Types Supported

Called on `DevHandle` instances.

* `control_transfer`
* `bulk_transfer`
* `interrupt_transfer`

## HID API

Look into this.

## References

* [USB Made Simple](http://www.usbmadesimple.co.uk/)
* [USB - Wikipedia](https://en.wikipedia.org/wiki/USB)
* [USB 3.1 Specification](http://www.usb.org/developers/docs/)
* [libusb](http://libusb.org/static/api-1.0/) - C library for interfacing with USB devices
* [libusb wiki](https://github.com/libusb/libusb/wiki)
* [Intro to libusb](http://www.dreamincode.net/forums/topic/148707-introduction-to-using-libusb-10/)
