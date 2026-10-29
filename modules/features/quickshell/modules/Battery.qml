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

    visible: BatteryManager.batteryPresent

    Text {
        id: battery

        text: hoverHandler.hovered ? BatteryManager.getTextHovered() : BatteryManager.getText();
        color: BatteryManager.getColor()
        anchors.centerIn: parent

        font {
            family: "JetBrainsMono Nerd Font"
            pixelSize: 14
        }
    }

    Behavior on implicitWidth {
        SpringAnimation {
            damping: 0.3
            spring: 4
        }
    }

    HoverHandler {
        id: hoverHandler
    }
}   
