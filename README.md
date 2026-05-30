# KIWI — KiwiSDR Operations Center

Remote HF radio monitoring via KiwiSDR software-defined receivers.

## Structure

```
KIWI/
├── README.md              ← You are here
├── logs/                  ← Signal logs, session transcripts
├── screenshots/           ← Timestamped waterfall/receiver captures
├── research/              ← Frequency guides, propagation data, station databases
└── scripts/               ← Automation scripts for tuning, scanning, recording
```

## Active Receiver

**KB8VUC** — Wayland, MI, USA  
`http://kb8vuckiwi.proxy.kiwisdr.com:8073/`  
KiwiSDR 2 | 9:1 End Fed | 10 kHz – 32 MHz | 8 RX channels

## Quick Start

Tuning is done via browser-harness using the KiwiSDR's internal JS API:
```javascript
js('ext_tune(1300, "am", 0);')   // freq_kHz, mode, zoom
```

See `research/operations_manual.md` for the full control reference.
