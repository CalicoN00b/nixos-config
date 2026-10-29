pragma Singleton
import Quickshell
import Quickshell.Services.UPower
import QtQuick
import "../Colors.js" as Colors

Singleton {
    id: root

    property UPowerDevice mainBattery: UPower.displayDevice || undefined
    property double batteryPercentage: root.mainBattery.percentage * 100 || 0
    property bool batteryPresent: root.mainBattery.ready || false

    function getColor() {
        if (mainBattery.state == UPowerDeviceState.FullyCharged) {
            return Colors.green;
        } else if (mainBattery.state == UPowerDeviceState.Charging) {
            return Colors.peach;
        } else if (root.batteryPercentage <= 10) {
            return Colors.red;
        } else {
            return Colors.text;
        }
    }

    function getIcon() {
        if (mainBattery.state == UPowerDeviceState.Charging) {
            return "󰂄"; // f0084
        } else if (batteryPercentage >= 95) {
            return " "; // f240
        } else if (batteryPercentage >= 66) {
            return " "; // f241
        } else if (batteryPercentage >= 33) {
            return " "; // f242
        } else if (batteryPercentage >= 10) {
            return " "; // f243
        } else {
            return " "; // f244
        }
    }

    function getText() {
        return getIcon() + " " + root.batteryPercentage + "%";
    }
}
