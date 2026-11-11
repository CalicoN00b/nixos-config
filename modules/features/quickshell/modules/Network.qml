import Quickshell
import QtQuick
import "../Colors.js" as Colors
import "../services/"

Rectangle {
    id: root

    implicitHeight: 35
    implicitWidth: network.implicitWidth + 20
    radius: implicitHeight / 2

    color: Colors.base

    border {
        width: 2
        color: NetworkManager.getColor()
    }

    Text {
        id: network

        text: NetworkManager.getText()
        color: NetworkManager.getColor()
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
}
