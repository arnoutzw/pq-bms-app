# Powerqueen BMS Monitor

A Bluetooth BLE battery management monitor for real-time monitoring of Powerqueen LiFePO4 batteries with comprehensive health metrics and dual-battery support.

## Screenshots

[Screenshot placeholder - Battery monitoring dashboard with live data and graphs]

## Features

- **BLE Connectivity** - Connect to 2 Powerqueen batteries simultaneously
- **Real-Time Monitoring** - Track voltage, current, power, and capacity
- **Individual Cell Voltages** - View voltage of each cell with balancing status indicators
- **Temperature Monitoring** - Monitor cell temperature and MOSFET temperature
- **Health Metrics** - Display:
  - State of Charge (SOC)
  - State of Health (SOH)
  - Protection status
  - Cycle count
- **Live History Graphs** - Visualize voltage, current, and temperature over time
- **Combined System Stats** - Monitor dual-battery system as unified view
- **Auto-Refresh** - 5-second automatic refresh for up-to-date information
- **Installable PWA** - Works offline and installs as native-like app

## Tech Stack

- HTML5
- JavaScript
- Web Bluetooth API
- Progressive Web App (PWA)

## Getting Started

### Quick Start

1. **Online Demo**: Visit [Powerqueen BMS Monitor Live](https://arnoutzw.github.io/pq-bms-app/)
2. **Local Setup**: Clone the repository and open `index.html` in your web browser

```bash
git clone https://github.com/arnoutzw/pq-bms-app.git
cd pq-bms-app
# Open index.html in your browser
```

### Installation

This is a PWA that works entirely in your browser. For best experience:
- Install as a PWA on your device for quick access
- Use a modern web browser with Bluetooth support (Chrome, Edge on desktop; Safari 13+ on macOS/iOS)
- Ensure Bluetooth is enabled on your device

## Usage

1. **Enable Bluetooth** - Turn on Bluetooth on your device
2. **Connect Batteries** - Click "Scan" and select your Powerqueen battery(ies)
3. **Monitor Status** - View real-time voltage, current, and power readings
4. **Check Health** - Review SOC, SOH, and protection status
5. **Analyze Trends** - Use history graphs to track battery performance over time
6. **Manage Dual-Battery** - Monitor both batteries with combined system statistics

## Requirements

- Powerqueen LiFePO4 battery with BLE functionality
- Device with Bluetooth 5.0+ and Web Bluetooth API support
- Modern web browser (Chrome/Edge 56+, Safari 13+)


## Theme Support

The app supports two themes:

- **Dark** (default) - Dark background with amber accents
- **ASML Light** - Light theme following ASML corporate design (deep blue #10069f, cyan accents)

When embedded in the Black Sphere Industries portal, theme changes are communicated via `postMessage`:

```javascript
// Sent to parent when theme changes
window.parent.postMessage({ type: "theme-change", theme: "dark" | "asml" }, "*");
```

## License

MIT License - feel free to use this project for personal or commercial purposes.

## Author

Created by arnoutzw
