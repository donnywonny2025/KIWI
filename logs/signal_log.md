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
