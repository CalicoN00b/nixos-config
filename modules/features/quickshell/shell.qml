import Quickshell
import QtQuick
import "./Modules/"

PanelWindow {
    id: bar

    anchors {
	top: true
	left: true
	right: true
    }

    margins {
	top: 5
	left: 5
	right: 5
    }

    implicitHeight: 35
    color: "transparent"
    
    Clock {}
}
