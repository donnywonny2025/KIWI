# Signal Log

Master record of all signals received. Each entry is a complete capture with full metadata.

---

## SIG-001 — WOOD 1300 AM (Grand Rapids, MI)

### Signal Metadata
| Field | Value |
|-------|-------|
| **Signal ID** | SIG-001 |
| **Status** | ✅ CONFIRMED |
| **Timestamp** | 2026-05-30 01:17 EDT / 05:17 UTC |
| **Frequency** | 1300.00 kHz |
| **Mode** | AM |
| **Band** | Medium Wave (MW Broadcast) |

### Station Info
| Field | Value |
|-------|-------|
| **Call Sign** | WOOD |
| **Branding** | NewsRadio WOOD 1300 & 106.9 FM |
| **Format** | News/Talk |
| **Owner** | iHeartMedia, Inc. |
| **Licensed To** | Grand Rapids, MI |
| **Simulcast** | 106.9 FM (WOOD-FM, Muskegon) |
| **Programming** | Clay Travis & Buck Sexton, Sean Hannity, Dave Ramsey, Coast to Coast AM (overnight) |
| **Confirmed Live** | ✅ Coast to Coast AM w/ George Noory — confirmed 01:45 EDT 2026-05-30 |

### Receiver
| Field | Value |
|-------|-------|
| **KiwiSDR** | KB8VUC |
| **Receiver Location** | Wayland, MI, USA (EN72er) |
| **Antenna** | 9:1 End Fed |
| **Distance to TX** | ~25 miles (Wayland → Grand Rapids) |
| **Propagation** | Ground wave (local) |

### Signal Quality
| Field | Value |
|-------|-------|
| **S-Meter** | -70.6 dBm (S7) |
| **SNR** | 16/15 dB |
| **Quality** | Strong, clear — local ground wave signal |

### Tuning Command
```javascript
js('ext_tune(1300, "am", 0);')
```

### Screenshots
- `screenshots/kiwisdr_2026-05-30_01-21_active_signal_*.png`

### Notes
- First confirmed station reception on this KiwiSDR
- **01:25 EDT** — Heard religious sermon / end-times preaching (paid overnight programming block)
- **01:45 EDT** — ✅ **Coast to Coast AM with George Noory confirmed live** — classic overnight content
- Station is 5 kW, ~25 miles from receiver — ground wave, no ionospheric skip needed
- Excellent signal strength confirms receiver and antenna are healthy
- Signal holds steady S7 (-70 to -71 dBm) — strongest signal we've received

---

## SIG-002 — WWV 5 MHz (Fort Collins, CO)

### Signal Metadata
| Field | Value |
|-------|-------|
| **Signal ID** | SIG-002 |
| **Status** | ✅ CONFIRMED (weak) |
| **Timestamp** | 2026-05-30 01:10 EDT / 05:10 UTC |
| **Frequency** | 5000.00 kHz |
| **Mode** | AM |
| **Band** | 60m (HF) |

### Station Info
| Field | Value |
|-------|-------|
| **Call Sign** | WWV |
| **Operator** | NIST (National Institute of Standards and Technology) |
| **Format** | Time signal — ticks every second, voice every minute |
| **Licensed To** | Fort Collins, CO, USA |
| **Power** | 10 kW |
| **Active Since** | 1920 |

### Receiver
| Field | Value |
|-------|-------|
| **KiwiSDR** | KB8VUC |
| **Receiver Location** | Wayland, MI, USA (EN72er) |
| **Antenna** | 9:1 End Fed |
| **Distance to TX** | ~1,200 miles (Wayland → Fort Collins) |
| **Propagation** | Skywave (ionospheric bounce) — weak at night on 5 MHz |

### Signal Quality
| Field | Value |
|-------|-------|
| **S-Meter** | -75.4 dBm (S4) |
| **Quality** | Faint — audible ticks but weak. 5 MHz in possible skip zone at 1 AM |

### Tuning Command
```javascript
js('ext_tune(5000, "am", 0);')
```

### Notes
- Initially tuned in LSB mode by mistake — sounded like clicking only
- Switched to AM mode — ticks became audible
- Signal weak from Michigan at night — try 10 MHz daytime or 2500 kHz nighttime for better reception
- WWV broadcasts on 2500, 5000, 10000, 15000, 20000 kHz simultaneously

---

## SIG-003 — Radio Havana Cuba / RHC (Havana, Cuba)

### Signal Metadata
| Field | Value |
|-------|-------|
| **Signal ID** | SIG-003 |
| **Status** | ✅ CONFIRMED |
| **Timestamp** | 2026-05-30 01:53 EDT / 05:53 UTC |
| **Frequency** | 7435.00 kHz (found at 7433.67, recentered) |
| **Mode** | AM |
| **Band** | 41m (HF Shortwave) |

### Station Info
| Field | Value |
|-------|-------|
| **Call Sign** | RHC |
| **Branding** | Radio Habana Cuba |
| **Format** | State broadcasting — Spanish-language programming |
| **Operator** | Cuban government (ICRT) |
| **Licensed To** | Havana, Cuba |
| **Power** | 250 kW |
| **Language** | Spanish |

### Receiver
| Field | Value |
|-------|-------|
| **KiwiSDR** | KB8VUC |
| **Receiver Location** | Wayland, MI, USA (EN72er) |
| **Antenna** | 9:1 End Fed |
| **Distance to TX** | ~1,200 miles (Wayland → Havana) |
| **Propagation** | Skywave — ionospheric F-layer bounce, nighttime |

### Signal Quality
| Field | Value |
|-------|-------|
| **Quality** | Clear voice audio, readable Spanish |

### Tuning Command
```javascript
js('ext_tune(7435, "am", 0);')
```

### Notes
- First international signal — picking up Cuba from Michigan
- Discovered at 7433.67 kHz (1.3 kHz off center), recentered to 7435
- 250 kW transmitter — one of the most powerful shortwave broadcasters in the Western Hemisphere
- Beams Spanish programming toward North America overnight
- Proves HF skywave propagation is working — ionospheric bounce confirmed over 1,200 miles

---

<!-- WRMI -->
## SIG-004 — WRMI Radio Miami International (Okeechobee, FL)

### Signal Metadata
| Field | Value |
|-------|-------|
| **Signal ID** | SIG-004 |
| **Status** | ✅ CONFIRMED |
| **Timestamp** | 2026-05-30 01:59 EDT / 05:59 UTC |
| **Frequency** | 9395.00 kHz |
| **Mode** | AM / SAM |
| **Band** | 31m (HF Shortwave) |

### Station Info
| Field | Value |
|-------|-------|
| **Call Sign** | WRMI |
| **Branding** | Radio Miami International |
| **Format** | Relay broadcaster — third-party programs |
| **Licensed To** | Okeechobee, FL, USA |
| **Power** | 100 kW |
| **Program Confirmed** | 📡 **Supreme Master Television** (brokered airtime block) — Spiritual and lifestyle programming by the Supreme Master Ching Hai Association. Slogan: *"Be Vegan, Make Peace"* (heard as *"Be Vegan, Keep Peace"*). |

### Receiver
| Field | Value |
|-------|-------|
| **KiwiSDR** | KB8VUC |
| **Receiver Location** | Wayland, MI, USA (EN72er) |
| **Antenna** | 9:1 End Fed |
| **Distance to TX** | ~1,100 miles |
| **Propagation** | Skywave — nighttime F-layer bounce |

### Signal Quality
| Field | Value |
|-------|-------|
| **S-Meter** | -55.6 dBm (S9) |
| **Quality** | Strong and clear in SAM mode — locks carrier, minimizes fading |

### Screenshots
- `screenshots/kiwisdr_2026-05-30_02-30_wrmi9395_active.png`
- `screenshots/kiwisdr_2026-05-30_02-38_wrmi9395_clear.png`

### Notes
- Also broadcasts on 5850, 7570, 9455 kHz.
- Sells airtime blocks to religious, cultural, and political organizations worldwide.
- **02:35 EDT**: Switched from AM to SAM (Synchronous AM) to resolve fading.
- **02:38 EDT**: Confirmed program identification: *"One World of Peace Through Music, part 11 of 11"* broadcast by Supreme Master Television (a spiritual group promoting peace, vegetarianism, classical music, and spiritual lectures on God). Fits the user's report of hearing ballroom atmosphere, laughing, solo classical piano, and talks about God.
- 31m band shows excellent skywave propagation from south-central Florida to rural Michigan at night.

---

## SIG-005 — BBC World Service (United Kingdom)

### Signal Metadata
| Field | Value |
|-------|-------|
| **Signal ID** | SIG-005 |
| **Status** | ✅ CONFIRMED |
| **Timestamp** | 2026-05-30 02:04 EDT / 06:04 UTC |
| **Frequency** | 9410.00 kHz (found at 9409.92) |
| **Mode** | AM |
| **Band** | 31m (HF Shortwave) |

### Station Info
| Field | Value |
|-------|-------|
| **Branding** | BBC World Service |
| **Format** | News / Current Affairs — English |
| **Operator** | British Broadcasting Corporation |
| **TX Site** | Woofferton, England |
| **Power** | 250 kW |

### Receiver
| Field | Value |
|-------|-------|
| **KiwiSDR** | KB8VUC |
| **Receiver Location** | Wayland, MI, USA (EN72er) |
| **Distance to TX** | ~3,800 miles — transatlantic |
| **Propagation** | Multi-hop skywave across Atlantic |

### Notes
- First transatlantic signal — England to Michigan
- BBC World Service is the most listened-to international broadcaster
- 3,800+ miles via 2-3 ionospheric bounces across the Atlantic Ocean

---

## SIG-006 — WWV 10 MHz (Fort Collins, CO)

### Signal Metadata
| Field | Value |
|-------|-------|
| **Signal ID** | SIG-006 |
| **Status** | ✅ CONFIRMED |
| **Timestamp** | 2026-05-30 08:16 EDT / 12:16 UTC |
| **Frequency** | 10000.00 kHz |
| **Mode** | AM |
| **Band** | 30m (HF) |

### Station Info
| Field | Value |
|-------|-------|
| **Call Sign** | WWV |
| **Operator** | NIST (National Institute of Standards and Technology) |
| **Format** | Time signal — ticks every second, voice every minute |
| **Licensed To** | Fort Collins, CO, USA |
| **Power** | 10 kW |

### Receiver
| Field | Value |
|-------|-------|
| **KiwiSDR** | KB8VUC |
| **Receiver Location** | Wayland, MI, USA (EN72er) |
| **Antenna** | 9:1 End Fed |
| **Distance to TX** | ~1,200 miles |
| **Propagation** | Skywave — daytime F-layer reflection |

### Signal Quality
| Field | Value |
|-------|-------|
| **S-Meter** | -63.7 dBm (S8-S9) |
| **Quality** | Strong carrier with time ticks and voice; some atmospheric static but fully readable. |

### Tuning Command
```javascript
js('ext_tune(10000, "am", 0);')
```

### Screenshots
- `screenshots/kiwisdr_2026-05-30_08-16_wwv10000am.png`

### Notes
- Confirmed very strong reception during the morning.
- S-meter reading of -63.7 dBm makes this one of the strongest HF skywave signals received so far.
- Ticks and voice announcements are fully readable, indicating excellent propagation conditions on the 30-meter band.

---

## SIG-007 — Radio Martí (Greenville, NC)

### Signal Metadata
| Field | Value |
|-------|-------|
| **Signal ID** | SIG-007 |
| **Status** | ✅ CONFIRMED |
| **Timestamp** | 2026-05-30 08:20 EDT / 12:20 UTC |
| **Frequency** | 9805.00 kHz |
| **Mode** | AM |
| **Band** | 31m (HF Shortwave) |

### Station Info
| Field | Value |
|-------|-------|
| **Call Sign** | Radio Martí |
| **Format** | US government-funded international broadcast (Spanish) |
| **Operator** | U.S. Agency for Global Media (USAGM) |
| **TX Site** | Greenville Transmitting Station, North Carolina, USA |
| **Target Area** | Cuba |
| **Power** | 250 kW |
| **Language** | Spanish |

### Receiver
| Field | Value |
|-------|-------|
| **KiwiSDR** | KB8VUC |
| **Receiver Location** | Wayland, MI, USA (EN72er) |
| **Antenna** | 9:1 End Fed |
| **Distance to TX** | ~650 miles |
| **Propagation** | Skywave — daytime ionospheric reflection |

### Signal Quality
| Field | Value |
|-------|-------|
| **S-Meter** | -55.0 dBm (S9+) |
| **Quality** | Strong, clear Spanish programming; booming carrier. |

### Tuning Command
```javascript
js('ext_tune(9805, "am", 0);')
```

### Screenshots
- `screenshots/kiwisdr_2026-05-30_08-20_radiomarti9805am.png`

### Notes
- Discovered initially as an adjacent carrier while tuned to 9810 kHz.
- Centered at 9805 kHz, resulting in excellent clarity and a strong S9+ S-meter reading of -55.0 dBm.
- Radio Martí transmits from the massive USAGM facilities in Greenville, NC, targeting Cuba with news, talk, and music. The relatively close proximity (650 miles) and high transmitter power (250 kW) result in an exceptionally clean signal in Michigan during the morning.

---

## SIG-008 — Radio Martí (Greenville, NC)

### Signal Metadata
| Field | Value |
|-------|-------|
| **Signal ID** | SIG-008 |
| **Status** | ✅ CONFIRMED |
| **Timestamp** | 2026-05-30 09:25 EDT / 13:25 UTC |
| **Frequency** | 11930.00 kHz |
| **Mode** | SAM |
| **Band** | 25m (HF Shortwave) |

### Station Info
| Field | Value |
|-------|-------|
| **Call Sign** | Radio Martí |
| **Format** | US government-funded international broadcast (Spanish) |
| **Operator** | U.S. Agency for Global Media (USAGM) |
| **TX Site** | Greenville Transmitting Station, North Carolina, USA |
| **Target Area** | Cuba |
| **Power** | 250 kW |
| **Language** | Spanish |

### Receiver
| Field | Value |
|-------|-------|
| **KiwiSDR** | KB8VUC |
| **Receiver Location** | Wayland, MI, USA (EN72er) |
| **Antenna** | 9:1 End Fed |
| **Distance to TX** | ~650 miles |
| **Propagation** | Skywave — daytime ionospheric reflection |

### Signal Quality
| Field | Value |
|-------|-------|
| **S-Meter** | -38.3 dBm (S9+40 dB) |
| **Quality** | Booming signal; extremely clear Spanish voice broadcast in SAM mode. |

### Tuning Command
```javascript
js('ext_tune(11930, "sam", 0);')
```

### Screenshots
- `screenshots/kiwisdr_2026-05-30_09-17_11930am_wrmi_11930_mac.png`
- `screenshots/kiwisdr_2026-05-30_09-21-26_manual_capture_mac.png`

### Notes
- Centered at 11930 kHz, resulting in excellent clarity with a locked SAM carrier.
- User confirmed hearing Spanish broadcast clearly at this frequency.
- Transmitted from the Greenville, NC site at 250 kW, providing outstanding propagation into Michigan.

---

<!-- TEMPLATE FOR NEW ENTRIES


## SIG-XXX — [Station Name]

### Signal Metadata
| Field | Value |
|-------|-------|
| **Signal ID** | SIG-XXX |
| **Status** | ✅ CONFIRMED / ❓ UNIDENTIFIED / 📡 MONITORING |
| **Timestamp** | YYYY-MM-DD HH:MM EDT / HH:MM UTC |
| **Frequency** | XXXX.XX kHz |
| **Mode** | AM / LSB / USB / CW / NBFM |
| **Band** | |

### Station Info
| Field | Value |
|-------|-------|
| **Call Sign** | |
| **Format** | |
| **Licensed To** | |
| **Power** | |

### Receiver
| Field | Value |
|-------|-------|
| **KiwiSDR** | KB8VUC |
| **Receiver Location** | Wayland, MI, USA (EN72er) |
| **Antenna** | 9:1 End Fed |
| **Distance to TX** | |
| **Propagation** | |

### Signal Quality
| Field | Value |
|-------|-------|
| **S-Meter** | |
| **Quality** | |

### Tuning Command
```javascript
js('ext_tune(FREQ, "MODE", 0);')
```

### Notes
-

-->
