import Quickshell
import Quickshell.Services.UPower
import QtQuick
import "../Colors.js" as Colors

Rectangle {
    id: root

    property UPowerDevice mainBattery: UPower.displayDevice || undefined
    property bool batteryPresent: root.mainBattery.ready || false

    implicitHeight: 35
    implicitWidth: battery.implicitWidth + 20
    radius: implicitHeight / 2

    color: Colors.base

    border {
	width: 2
	color: Colors.text
    }

    visible: batteryPresent

    Text {
	id: battery

	text: (root.mainBattery.percentage * 100) + "%";
	color: Colors.text
	anchors.centerIn: parent

	font {
	    family: "JetBrainsMono Nerd Font"
	    pixelSize: 14
	}
    }
}	
