pragma Singleton
import Quickshell
import Quickshell.Services.Pipewire
import QtQuick
import "../Colors.js" as Colors

Singleton {
    id: root

    property PwNode mainSource: Pipewire.defaultAudioSource
    property int volume: mainSource?.audio?.volume * 100 ?? 0
    property bool muted: mainSource?.audio?.muted || true

    function getColor() {
        if (muted) {
            return Colors.red;
        } else {
            return Colors.text;
        }
    }

    function getIcon() {
        if (muted) {
            return "󰖁 ";
        } else if (volume >= 66) {
            return "󰕾 ";
        } else if (volume >= 33) {
            return "󰖀 ";
        } else {
            return "󰕿 ";
        }
    }

    function getText() {
        return getIcon() + " " + volume + "%";
    }
}
