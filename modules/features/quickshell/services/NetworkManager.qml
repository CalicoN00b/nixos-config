pragma Singleton
import Quickshell
import Quickshell.Networking
import QtQuick
import "../Colors.js" as Colors

Singleton {
    id: root

    property var devices: Networking.devices.values
    property var wifiDevice: devices.find(d => d.type === DeviceType.Wifi) ?? null
    property var ethernetDevice: devices.find(d => d.type === DeviceType.Wired) ?? null

    property bool wifiEnabled: Networking.wifiEnabled

    property var networks: wifiDevice?.networks.values ?? []
    property var active: networks.find(n => n.connected) ?? null

    property bool wifiConnected: wifiDevice?.connected ?? false
    property bool ethernetConnected: ethernetDevice?.connected ?? false

    function getColor() {
        if (!(wifiConnected || ethernetConnected)) {
            return Colors.red;
        } else {
            return Colors.text;
        }
    }

    // This will probably be redone in the future to support
    // wifi icon changing based on signal strength
    function getIcon() {
        if (ethernetConnected) {
            return " ";
        } else if (wifiConnected) {
            return "󰖩 ";
        } else {
            return "󰖪 ";
        }
    }

    function getText() {
        if (ethernetConnected) {
            return getIcon() + " Wired Connection";
        } else if (wifiConnected) {
            let name = active?.name ?? "No Wifi Name";
            let strength = active?.signalStrength * 100 ?? 0;
            return getIcon() + " " + name + " (" + strength + "%)";
        } else {
            return getIcon() + " Disconnected";
        }
    }
}
