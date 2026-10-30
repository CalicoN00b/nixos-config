import Quickshell
import QtQuick
import "../Colors.js" as Colors
import "../services/"

Rectangle {
    id: root

    implicitHeight: 35
    implicitWidth: audio.implicitWidth + 20
    radius: implicitHeight / 2

    color: Colors.base

    border {
        width: 2
        color: AudioManager.getColor()
    }

    visible: AudioManager.mainSink?.ready ?? false

    Text {
        id: audio

        text: hoverHandler.hovered ? AudioManager.mainSink?.description : AudioManager.getText()
        color: AudioManager.getColor()
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
