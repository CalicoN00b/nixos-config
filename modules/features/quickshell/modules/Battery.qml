import Quickshell
import Quickshell.Services.UPower
import QtQuick
import "../Colors.js" as Colors
import "../services/"

Rectangle {
    id: root

    implicitHeight: 35
    implicitWidth: battery.implicitWidth + 20
    radius: implicitHeight / 2

    color: Colors.base

    border {
        width: 2
        color: BatteryManager.getColor()
    }

    visible: batteryPresent

    Text {
        id: battery

        text: BatteryManager.getText();
        color: BatteryManager.getColor()
        anchors.centerIn: parent

        font {
            family: "JetBrainsMono Nerd Font"
            pixelSize: 14
        }
    }
}   
