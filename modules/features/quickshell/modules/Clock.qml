import Quickshell
import QtQuick
import "../Colors.js" as Colors

Rectangle {
    id: root

    implicitHeight: 35
    implicitWidth: clock.implicitWidth + 20
    radius: implicitHeight / 2

    color: Colors.base

    border {
        width: 2
        color: Colors.text
    }

    Text {
        id: clock

        SystemClock {
            id: sysclock
            precision: SystemClock.Minutes
        }

        text: hoverHandler.hovered ? Qt.formatDateTime(sysclock.date, "dddd, MMMM d, yyyy") : Qt.formatDateTime(sysclock.date, "h:mm AP")
        color: Colors.text
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
