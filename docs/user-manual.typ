// PQ BMS — User Manual
// Black Sphere Industries

#set document(title: "PQ BMS — User Manual", author: "Black Sphere Industries")
#set page(paper: "a4", margin: (top: 2.5cm, bottom: 2.5cm, left: 2cm, right: 2cm))
#set text(font: "New Computer Modern", size: 11pt)
#set heading(numbering: "1.1")

// ── Title page ──
#align(center)[
  #v(4cm)
  #text(size: 28pt, weight: "bold")[PQ BMS]
  #v(0.5cm)
  #text(size: 14pt, fill: rgb("#71717a"))[Powerqueen BMS Monitor]
  #v(2cm)
  #text(size: 16pt)[User Manual]
  #v(1cm)
  #line(length: 40%, stroke: 0.5pt + rgb("#f59e0b"))
  #v(1cm)
  #text(size: 11pt, fill: rgb("#71717a"))[
    Black Sphere Industries \
    Version 1.0 --- March 2026
  ]
]

#pagebreak()
#outline(title: "Table of Contents", indent: 1.5em)
#pagebreak()

= Introduction

PQ BMS (Powerqueen BMS Monitor) is a Progressive Web App developed by Black Sphere Industries for real-time monitoring of Powerqueen LiFePO4 battery management systems via Bluetooth Low Energy (BLE). It supports simultaneous monitoring of up to two batteries, providing state-of-charge visualization, individual cell voltage monitoring, protection status, and live history charting.

The app communicates with Powerqueen BMS units over the BLE GATT protocol using a binary command/response format, all running client-side in the browser via the Web Bluetooth API.

= Getting Started

== System Requirements

- *Browser:* Chrome, Edge, or Opera on desktop or Android. Web Bluetooth is required and is *not* supported in Firefox or Safari.
- *Bluetooth:* A BLE-capable Bluetooth adapter on the host device
- *Battery:* One or two Powerqueen LiFePO4 batteries with BLE-enabled BMS

== Connecting a Battery

+ Open the PQ BMS application URL
+ Click *Connect Battery 1* on the connect screen
+ In the browser's Bluetooth pairing dialog, select your Powerqueen BMS device (filtered by service UUID 0xFFE0)
+ The dashboard appears with live battery data

== Connecting a Second Battery

After the first battery is connected:
+ Click *Add Battery 2* in the toolbar
+ Pair the second BMS device
+ A dual-panel layout appears with side-by-side monitoring
+ A combined system summary banner shows aggregate statistics

= Features

== State of Charge (SOC) Display

Each battery panel features a prominent SOC ring visualization:
- A circular gauge with animated fill showing the current SOC percentage
- Color-coded: green (healthy), yellow (moderate), red (low)
- Status text below the ring indicating charge state (Charging, Discharging, Idle)

== Quick Statistics

Three stat cards per battery show at-a-glance values:
- *Voltage:* Total pack voltage
- *Current:* Charge/discharge current with direction indicator
- *Power:* Instantaneous power in watts

== Cell Voltage Grid

An expandable section displays individual cell voltages in a 2-column grid:
- Each cell shows its voltage with precision formatting
- A color-coded bar below each cell indicates relative voltage within the pack
- Cell imbalance is immediately visible from the bar heights

== Battery Information

A collapsible section shows detailed BMS parameters:
- Total capacity and remaining capacity
- Cycle count
- Temperature readings from BMS sensors
- BMS firmware version (retrieved via a separate version command)

== Protection Status

The BMS reports active protection flags. The dashboard displays these as color-coded badges:
- Green badges for normal states
- Yellow badges for warnings
- Red badges for active protection conditions (over-voltage, under-voltage, over-current, over-temperature, etc.)

== Combined System Summary

When two batteries are connected, a summary banner appears above the dual-panel layout showing:
- *Total Voltage:* Sum of both pack voltages
- *Total Capacity:* Combined remaining capacity
- *Total Power:* Combined instantaneous power
- *Stored Energy:* Combined energy in watt-hours

== Live History Chart

A shared chart section at the bottom of the dashboard renders rolling time-series data:
- SOC and voltage traces for each connected battery
- Color-coded per battery (amber for Battery 1, gold for Battery 2)
- Up to 60 data points of history

== Auto-Refresh

The toolbar provides manual and automatic refresh options:
- *Refresh All:* Manually polls all connected BMS units
- *Auto: On/Off:* Toggles periodic automatic polling

= User Interface

== Header
The sticky header contains:
- Battery icon and "PQ BMS" title
- Connection status dots for each device (green = connected, yellow = connecting, red = disconnected)
- Device name labels

== Connect Screen
Displayed when no devices are connected. Shows a floating battery animation, description text, and the *Connect Battery 1* button. A warning message appears if Web Bluetooth is not supported.

== Dashboard
The main dashboard layout consists of:
- *Toolbar:* Refresh All, Auto toggle, and Add Battery 2 buttons
- *Combined Banner:* Aggregate stats (visible with 2 batteries)
- *Dual Layout:* Side-by-side battery panels
- *Each Panel:* SOC ring, quick stats, cell voltage grid, battery info, protection status
- *History Section:* Live chart with legend
- *Last Update:* Timestamp of the most recent data fetch

== Toast Notifications
Error toasts appear as a red banner at the bottom center of the screen.

== Theme Support
PQ BMS supports dark (default) and light themes:
- When embedded in the BSI portal, the theme is controlled by the parent frame
- In standalone mode, theme is read from localStorage
- The BSI Theme Bridge ensures consistent appearance with the portal

= Workflows

== Single Battery Monitoring

+ Connect a Powerqueen battery via the connect screen
+ Review the SOC ring for overall charge status
+ Check quick stats for voltage, current, and power
+ Expand the cell voltage section to inspect cell balance
+ Enable auto-refresh for continuous monitoring

== Dual Battery System Monitoring

+ Connect Battery 1
+ Click *Add Battery 2* and connect the second unit
+ Monitor the combined system banner for total voltage, capacity, and power
+ Compare cell voltages between batteries using the side-by-side layout
+ Use the history chart to track SOC trends over time for both units

== Diagnosing Cell Imbalance

+ Expand the cell voltage grid for the battery of interest
+ Compare bar heights --- cells with significantly lower bars indicate imbalance
+ Note the maximum and minimum cell voltages
+ A large spread between cells may indicate the need for a balancing cycle

== Checking Protection Status

+ Scroll to the protection status section in each battery panel
+ Green badges indicate normal operation
+ Yellow or red badges indicate active protection conditions
+ Address root causes (e.g., reduce load for over-current, cool the battery for over-temperature)

= Architecture

This section presents the software architecture of PQ BMS using UML diagrams.

== Architecture Overview

#figure(
  image("uml-architecture.svg", width: 100%),
  caption: [Component architecture of the PQ BMS application.]
)

== Class Diagram

#figure(
  image("uml-class-diagram.svg", width: 100%),
  caption: [Class diagram showing the BmsConnection class and data structures.]
)

== Main Sequence

#figure(
  image("uml-seq-main.svg", width: 100%),
  caption: [Sequence diagram for BLE connection and data retrieval.]
)

== Secondary Sequences

#figure(
  image("uml-seq-secondary.svg", width: 100%),
  caption: [Sequence diagrams for auto-refresh, dual-battery, and error handling.]
)

== State Diagram

#figure(
  image("uml-states.svg", width: 100%),
  caption: [State machine diagram showing BLE connection states.]
)

= Configuration

== BLE Protocol

PQ BMS communicates with the Powerqueen BMS over BLE using:
- *Service UUID:* `0xFFE0`
- *Characteristic UUID:* `0000ffe1-0000-1000-8000-00805f9b34fb`
- *Commands:* Binary command packets with header `0x55AA` and command-specific payloads
  - `CMD_GET_VERSION` --- Retrieves BMS firmware version
  - `CMD_GET_BATTERY` --- Retrieves full battery status (SOC, voltage, current, cell voltages, temperatures, protection flags)

== Data Format

Battery data is received as a binary response buffer and parsed into:
- Pack voltage and current (signed, for charge/discharge direction)
- SOC percentage
- Individual cell voltages (variable count depending on battery configuration)
- Temperature sensor readings
- Active protection bit flags

== PWA Installation
PQ BMS can be installed as a PWA via the browser's install prompt. The service worker caches all assets for offline launch (BLE connectivity still requires the browser's Bluetooth stack).

== Theme Configuration
- localStorage key `pqbms_theme` stores the theme preference
- When embedded in the BSI portal, theme is controlled via postMessage

= Troubleshooting

== Common Issues

/ BMS device not found: Ensure the Powerqueen battery is powered on and the BMS board's BLE module is active. The BLE filter requires service UUID `0xFFE0` --- non-Powerqueen BMS devices will not appear.
/ "Web Bluetooth not supported" warning: Use Chrome, Edge, or Opera. Firefox and Safari do not support Web Bluetooth.
/ Data shows "--" after connecting: The initial data fetch may take a few seconds. Click *Refresh All* if data does not populate. Check the browser console for BLE communication errors.
/ Connection drops frequently: Ensure the device is within BLE range (~10 m line-of-sight). Interference from other Bluetooth devices or Wi-Fi can degrade BLE stability.
/ Cell voltages all show 0 V: The BMS response parsing may not match the specific battery model's cell count. Check the browser console for protocol parsing errors.
/ Second battery panel is empty: Click *Add Battery 2* and complete the BLE pairing dialog. Each battery requires a separate BLE connection.
/ SOC ring shows incorrect color: SOC color thresholds are hard-coded --- green above 50%, yellow 20--50%, red below 20%. These reflect typical LiFePO4 operating ranges.
