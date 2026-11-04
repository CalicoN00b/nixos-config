import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import "../Colors.js" as Colors

Rectangle {
    id: root

    implicitHeight: 35
    implicitWidth: layout.implicitWidth + 20
    radius: implicitHeight / 2

    color: Colors.base

    border {
        width: 2
        color: Colors.text
    }
    
    RowLayout {
        id: layout

        spacing: 5

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            leftMargin: 10
        }

        Repeater {
            model: Hyprland.workspaces

            Rectangle {
                id: workspace
                required property var modelData
                property bool focused: modelData.focused
                property int id: modelData.id

                implicitWidth: 30
                implicitHeight: 25
                color: Colors.base

                Text {
                    text: workspace.id
                    color: workspace.focused ? Colors.mauve : Colors.text
                    anchors.centerIn: parent

                    font {
                        family: "JetBrainsMono Nerd Font"
                        pixelSize: 14
                        underline: workspace.focused
                        bold: workspace.focused
                    }
                }
            }
        }
    }

    Behavior on implicitWidth {
        SpringAnimation {
            damping: 0.3
            spring: 4
        }
    }
}
