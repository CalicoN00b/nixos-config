import Quickshell
import QtQuick
import QtQuick.Layouts
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
    
    Row {
	id: right

	Layout.alignment: Qt.AlignTop
	spacing: 10

	anchors {
	    top: parent.top
	    right: parent.right
	}

	Battery {}

	Clock {}
    }
}
