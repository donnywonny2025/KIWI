# KiwiSDR Operations Manual

## What is a KiwiSDR?

A KiwiSDR is a standalone, browser-based Software Defined Radio (SDR) that digitizes the entire 10 kHz – 30 MHz radio spectrum simultaneously. It connects to the internet and lets anyone with a web browser tune into any frequency in that range from anywhere in the world. Ham radio operators host them voluntarily.

### KiwiSDR 2 Hardware Specs
| Spec | Value |
|------|-------|
| **Frequency Coverage** | 10 kHz – 30 MHz continuous |
| **ADC** | 14-bit LTC2248, 66.7 MSPS |
| **Dynamic Range** | >100 dB (500 Hz CW) |
| **Sensitivity** | 0.39 – 0.49 µV (SSB, 10 dB S+N/N) |
| **Input IP3** | +31 dBm |
| **Simultaneous Channels** | Up to 8 independent receivers |
| **GPS** | Built-in for frequency calibration + TDoA geolocation |
| **Power** | 5V DC, 1.5–2A (low-noise supply critical) |
| **Network** | Ethernet only, ~42 kB/s per session |
| **Enclosure** | Custom aluminum for heat dissipation |
| **Manufacturer** | KiwiSDR.nz (New Zealand) |
| **Price** | ~$300 USD |

### Global Network
- Directory: http://rx.kiwisdr.com
- Hundreds of receivers worldwide
- Each volunteer-hosted by a licensed ham radio operator
- Can switch between receivers for different propagation paths

---

## Our Active Receiver — KB8VUC

| Field | Value |
|-------|-------|
| **URL** | `http://kb8vuckiwi.proxy.kiwisdr.com:8073/` |
| **Callsign** | KB8VUC |
| **Location** | Wayland, MI, USA |
| **Grid** | EN72er |
| **Elevation** | 10m ASL |
| **Antenna** | 9:1 End Fed (broadband wire) |
| **Channels** | 8 total, 7 password-locked for autorun decoders |
| **Firmware** | v1.841, D11.11 |
| **ADC Clock** | 66.665933 MHz, GPS-disciplined |
| **SNR** | 15-16/15 dB |

### Location Advantages
- **Rural Michigan** = low RF noise floor (no dense urban interference)
- **US-131 highway** runs directly through Wayland (trucker CB traffic)
- **I-96** nearby (Grand Rapids corridor)
- **Center-continent** = catches ionospheric bounces from both coasts, Europe, South America
- **End Fed antenna** = omnidirectional, broadband coverage

---

## Tuning — The ext_tune() API

### CRITICAL: Use ONLY This Method

**DO NOT** click the frequency field and type. It appends instead of replaces and double-fires on clicks.

**USE `ext_tune()` via browser-harness JS call:**
```python
# Browser harness call:
js('ext_tune(1300, "am", 0);')
```

**Syntax:** `ext_tune(freq_kHz, mode_string, zoom_level)`

### Parameters

**Frequency** — in kHz (e.g., 1300 = 1300 kHz = 1.3 MHz)

**Mode strings:**
| Mode | String | Use For |
|------|--------|---------|
| AM | `"am"` | Broadcast radio, shortwave stations, WWV time signal |
| SAM | `"sam"` | Synchronous AM — better fidelity than AM, locks to carrier |
| DRM | `"drm"` | Digital Radio Mondiale (digital shortwave) |
| LSB | `"lsb"` | Ham voice below 10 MHz, SSB amateur radio |
| USB | `"usb"` | Ham voice above 10 MHz, aviation HF, maritime, military |
| CW | `"cw"` | Morse code |
| NBFM | `"nbfm"` | Narrowband FM |
| IQ | `"iq"` | Raw I/Q data for external decoders |

**Zoom** — 0 = full 30 MHz span, higher = more zoomed. Range: 0–14.

### Other JS API Functions
| Function | Purpose |
|----------|---------|
| `ext_tune(freq, mode, zoom)` | **PRIMARY** — tunes frequency, sets mode, adjusts zoom |
| `freqset_complete(freq_kHz)` | Set frequency only (no mode change) |
| `snd_send(cmd_string)` | Send raw command to sound channel |
| `freq_car_Hz` | Current carrier frequency in Hz (read/write) |
| `owrx` | Main receiver state object |

### KiwiClient Python API (External Control)
For headless/scripted recording:
```bash
python3 kiwirecorder.py -s kb8vuckiwi.proxy.kiwisdr.com -p 8073 -f 14230.0 -m usb
```
GitHub: https://github.com/jks-prv/kiwiclient

---

## Control Map (Fixed Screen Coordinates)

These coordinates are stable for the current browser session. Use for click_at_xy() operations.

### Frequency & Dropdowns
| Control | X | Y | Notes |
|---------|---|---|-------|
| **Frequency field** | 1583 | 556 | Display only — use ext_tune() to change |
| **Band select** | 1693 | 555 | Dropdown: LW, MW, 120m–10m |
| **Extension select** | 1809 | 555 | Dropdown: CW decoder, DRM, FAX, FFT, etc. |

### Mode Buttons
| Mode | X | Y |
|------|---|---|
| AM | 1551 | 614 |
| SAM | 1595 | 614 |
| DRM | 1644 | 614 |
| LSB | 1691 | 614 |
| USB | 1736 | 614 |
| CW | 1780 | 614 |
| NBFM | 1829 | 614 |
| IQ | 1876 | 614 |

### Navigation Bar
| Panel | X | Y | Purpose |
|-------|---|---|---------|
| RF | 1558 | 693 | RF gain, antenna selection |
| WF1 | 1609 | 693 | Waterfall display settings |
| Audio | 1661 | 693 | Compression, squelch, noise reduction |
| AGC | 1712 | 693 | Automatic Gain Control |
| User | 1763 | 693 | Connected users list |
| Stat | 1815 | 693 | System statistics |
| Off | 1866 | 693 | Disconnect |

### Tab Management Rules
- **ONE tab only** — never open new tabs via `new_tab()`. Use `goto_url()`.
- KiwiSDR has limited slots; duplicate connections kick the user.
- The harness tab persists between `browser-harness -c` calls.

---

## Extensions Available

Built-in signal decoders accessible via the extension dropdown:

| Extension | What It Does |
|-----------|-------------|
| **CW_decoder** | Decodes Morse code in real-time |
| **CW_skimmer** | Scans for multiple CW signals simultaneously |
| **FT8** | Decodes FT8 digital mode (ham radio weak-signal) |
| **WSPR** | Decodes WSPR beacon signals (propagation mapping) |
| **DRM** | Digital Radio Mondiale decoder |
| **FAX** | Weather facsimile image decoder |
| **SSTV** | Slow-scan television image decoder |
| **HFDL** | High Frequency Data Link (aircraft data) |
| **ALE_2G** | Automatic Link Establishment (military/gov) |
| **NAVTEX** | Maritime navigation/weather text broadcasts |
| **DSC** | Digital Selective Calling (maritime) |
| **TDoA** | Time Difference of Arrival — geolocate a signal |
| **FFT** | Spectral analysis tool |
| **DX spots** | Real-time DX cluster spots overlay |
| **FSK / RTTY** | Radio teletype decoder |
| **colormap** | Waterfall color scheme selector |
| **ant_switch** | Antenna switching (if hardware supports) |

---

## Frequency Guide

### Modes Explained

**AM (Amplitude Modulation)** — Carrier wave with audio on both sidebands. Used by broadcast stations, time signals, shortwave broadcasters. Simplest to decode.

**SSB (Single Sideband)** — Carrier removed, one sideband removed. More power-efficient. Two flavors:
- **LSB (Lower Sideband)** — Convention for frequencies below 10 MHz (ham 80m, 40m)
- **USB (Upper Sideband)** — Convention for frequencies above 10 MHz (ham 20m, 15m, 10m) plus ALL aviation, maritime, and military HF

**CW (Continuous Wave)** — Morse code. Pure tone keyed on/off.

**NBFM (Narrowband FM)** — Used on some utility services in the HF range.

### Band Naming Convention
Wavelength = 300,000,000 ÷ Frequency(Hz). Bands named by wave's physical length in meters.
- 27 MHz → 11 meters (CB radio)
- 14 MHz → 20 meters (ham band)
- 7 MHz → 40 meters (ham band)
- 3.5 MHz → 80 meters (ham band)
- 1 MHz → 300 meters (AM broadcast)

### CB Radio (Citizens Band) — 27 MHz / 11 meters
Standard CB uses AM mode. Sideband guys use USB.

| Channel | Freq (kHz) | Mode | Notes |
|---------|-----------|------|-------|
| 1 | 26965 | AM | First channel |
| 6 | 27025 | AM | "The Superbowl" — skip/chaos |
| 9 | 27065 | AM | Emergency channel |
| **19** | **27185** | **AM** | **THE trucker channel** — US-131 through Wayland |
| 20 | 27205 | AM | |
| 38 | 27385 | LSB/USB | SSB calling channel |
| 40 | 27405 | AM | Last channel |

### Time Signals (24/7 — Guaranteed)
| Freq (kHz) | Mode | Station | Location | Notes |
|------------|------|---------|----------|-------|
| 2500 | AM | WWV | Fort Collins, CO | Best nighttime from MI |
| 5000 | AM | WWV | Fort Collins, CO | May be in skip zone at night |
| 10000 | AM | WWV | Fort Collins, CO | Best daytime |
| 15000 | AM | WWV | Fort Collins, CO | Daytime only |
| 20000 | AM | WWV | Fort Collins, CO | Daytime, weak |
| 3330 | AM | CHU | Ottawa, Canada | Canadian time signal |
| 7850 | AM | CHU | Ottawa, Canada | |
| 14670 | AM | CHU | Ottawa, Canada | |

### Shortwave Broadcasters (North America targets)
| Freq (kHz) | Mode | Station | Notes |
|------------|------|---------|-------|
| 5085 | AM | WTWW | Tennessee — religious/talk |
| 5830 | AM | WTWW | Tennessee |
| 5850 | AM | WRMI | Florida — relay broadcaster |
| 5935 | AM | WWCR | Nashville — various programs |
| 6070 | AM | CFRX | Toronto — CBC relay |
| 7490 | AM | WBCQ | "The Planet" — indie broadcaster |
| 7570 | AM | WRMI | Florida |
| 9330 | AM | WBCQ | Same station, different freq |
| 9395 | AM | WRMI | Florida |
| 9455 | AM | WRMI | Florida |

**Live schedule lookup:** https://shortwave.am — search by time/freq/language

### Ham Radio Voice (Ragchew)
| Freq (kHz) | Mode | Band | Best Time | Notes |
|------------|------|------|-----------|-------|
| 1900–1950 | LSB | 160m | Night | Local/regional, atmospheric noise |
| 3885 | LSB | 75m | Night | **Big ragchew frequency** |
| 3840 | LSB | 75m | Night | Popular chat spot |
| 3916 | LSB | 75m | Night | Michigan/Midwest nets |
| 3860 | LSB | 75m | Night | Another active chat spot |
| 7200 | LSB | 40m | Night | Coast-to-coast |
| 7290 | LSB | 40m | Night | Net frequency |
| 14300 | USB | 20m | Daytime | Maritime mobile net |
| 14230 | USB | 20m | Daytime | SSTV (slow-scan TV images) |
| 14313 | USB | 20m | Daytime | Intercon net / general chat |
| 21300 | USB | 15m | Daytime | General calling |
| 28400 | USB | 10m | Daytime (solar max) | Sporadic openings |

### Digital Modes (Ham)
| Freq (kHz) | Mode | Protocol | Notes |
|------------|------|----------|-------|
| 3573 | USB | FT8 | 80m FT8 — very active |
| 7074 | USB | FT8 | 40m FT8 — heavy traffic |
| 10136 | USB | FT8 | 30m FT8 |
| 14074 | USB | FT8 | 20m FT8 — most popular |
| 7040 | USB | WSPR | 40m WSPR beacons |
| 10140 | USB | WSPR | 30m WSPR |
| 14097 | USB | WSPR | 20m WSPR |

### Military / Government
| Freq (kHz) | Mode | What | Notes |
|------------|------|------|-------|
| **11175** | **USB** | **USAF HFGCS** | **"Triple-one-seven-five" — EAMs, Skyking broadcasts** |
| **8992** | **USB** | **USAF HFGCS backup** | **Same network, backup freq** |
| 4725 | USB | USAF HFGCS | Lower freq, nighttime |
| 6739 | USB | USAF HFGCS | |
| 13200 | USB | USAF HFGCS | |
| 15016 | USB | USAF HFGCS | |
| 4625 | AM | UVB-76 "The Buzzer" | Russian numbers station — continuous buzz, occasional voice |
| 4724 | USB | USCG | Weather broadcasts |

### Aviation HF
| Freq (kHz) | Mode | What | Notes |
|------------|------|------|-------|
| 5450 | USB | VOLMET | Aviation weather broadcast |
| 6577 | USB | New York Radio | North Atlantic ATC |
| 8891 | USB | New York Radio | Higher freq |
| 10057 | USB | New York Radio | |
| 13306 | USB | New York Radio | |
| 5547 | USB | Caribbean ATC | |
| 3485 | USB | VOLMET Shannon | European aviation weather |
| 8957 | USB | VOLMET | Pacific |

### Maritime HF
| Freq (kHz) | Mode | What |
|------------|------|------|
| 4125 | USB | Maritime voice calling |
| 6215 | USB | Maritime voice |
| 8291 | USB | Maritime voice |
| 12290 | USB | Maritime voice |
| 8764 | USB | USCG weather broadcasts |

### Numbers Stations / Mysterious
| Freq (kHz) | Mode | What | Notes |
|------------|------|------|-------|
| 4625 | AM | UVB-76 "The Buzzer" | Russian — continuous buzz with rare voice interruptions |
| Various | USB/AM | Numbers stations | Rotate frequencies, check https://priyom.org for schedules |

### Pirate Radio
| Band | Freq Range | Notes |
|------|-----------|-------|
| 43m | 6800–7000 kHz | Most active pirate band in North America |
| 48m | 6200–6400 kHz | Secondary pirate band |
| | | Track on https://hfunderground.com |

---

## Propagation — What You Can Hear & When

### The Ionosphere
Radio waves bounce off charged layers of atmosphere 50–300 miles up. The sun controls these layers:
- **Daytime**: Dense ionosphere reflects higher frequencies (14–30 MHz), absorbs lower ones
- **Nighttime**: Ionosphere relaxes, reflects lower frequencies (1.8–7 MHz), higher ones pass through to space
- **Sunrise/Sunset**: ALL bands briefly open — best DX (distance) windows

### Time of Day Guide
| Time (EDT) | Best Bands | What You'll Hear |
|------------|-----------|-----------------|
| **Night (10 PM–6 AM)** | 160m, 80/75m, 40m (1.8–7 MHz) | Ham ragchew, coast-to-coast + international |
| **Morning (6–10 AM)** | 40m, 31m, 20m transitioning | Sunrise opening, European signals |
| **Midday (10 AM–4 PM)** | 20m, 17m, 15m (14–21 MHz) | Best DX, worldwide propagation |
| **Evening (4–10 PM)** | 20m closing, 40m opening | Transition period, good activity |

### Seasonal Factors
- **Summer**: More atmospheric noise (thunderstorms) on lower bands, better 10m sporadic-E
- **Winter**: Quieter low bands, longer nights = more 80m/40m time
- **Solar cycle**: Currently near solar maximum (Cycle 25) — excellent for higher bands

### From Wayland, MI Specifically
- Mid-continent position hears both coasts
- Europe comes in on 20m during morning/midday
- South America on 20m afternoon
- Japan/Pacific on 20m late afternoon (long path morning)
- Local truckers on CB any time trucks are rolling (US-131)

---

## Screenshot Protocol

All screenshots saved to `/Volumes/WORK 2TB/KIWI/screenshots/` with format:
```
kiwisdr_YYYY-MM-DD_HH-MM_description.png
```

Example: `kiwisdr_2026-05-30_01-17_wood1300am.png`

Take a fresh capture every time the user checks in.

---

## Live Schedule Resources
- **https://shortwave.am** — Search by time/freq/language, uses EiBi + AOKI databases
- **https://shortwavedb.org** — Quick search any frequency to see what's broadcasting
- **https://shortwave.live** — Highlights currently active frequencies in green
- **https://priyom.org** — Numbers station schedules and tracking
- **https://hfunderground.com** — Pirate radio and utility station monitoring
- **http://rx.kiwisdr.com** — Global KiwiSDR receiver directory
