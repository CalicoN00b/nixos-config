pragma Singleton
import Quickshell
import Quickshell.Services.UPower
import QtQuick
import "../Colors.js" as Colors

Singleton {
    id: root

    property UPowerDevice mainBattery: UPower.displayDevice || undefined
    property int batteryPercentage: root.mainBattery.percentage * 100 || 0
    property bool batteryPresent: root.mainBattery.ready || false

    function getColor() {
        if (mainBattery.state == UPowerDeviceState.FullyCharged) {
            return Colors.green;
        } else if (mainBattery.state == UPowerDeviceState.Charging) {
            return Colors.peach;
        } else if (root.batteryPercentage <= 10) {
            return Colors.red;
        } else {
            return Colors.text;
        }
    }

    function getIcon() {
        if (mainBattery.state == UPowerDeviceState.Charging) {
            return "󰂄"; // f0084
        } else if (batteryPercentage >= 95) {
            return " "; // f240
        } else if (batteryPercentage >= 66) {
            return " "; // f241
        } else if (batteryPercentage >= 33) {
            return " "; // f242
        } else if (batteryPercentage >= 10) {
            return " "; // f243
        } else {
            return " "; // f244
        }
    }

    function getText() {
        return getIcon() + " " + root.batteryPercentage + "%";
    }

    function getTextHovered() {
        let finalText = getIcon() + " ";
        if (mainBattery.state == UPowerDeviceState.FullyCharged) {
            finalText += "Fully Charged";
        } else if (mainBattery.state == UPowerDeviceState.Charging) {
            let time = mainBattery.timeToFull;
            if (time == 0) {
                return "Getting Time to Full...";
            } else {
                let timeArr = secondsToTime(time);
                if (timeArr.hours >= 1 || timeArr.hourNeedsIncrement == 1) {
                    finalText += timeArr.hours + "h ";
                    if (timeArr.minutesRounded >= 1) {
                        finalText += timeArr.minutes + "m";
                    }
                } else {
                    finalText += timeArr.minutes + "m " + timeArr.seconds + "s";
                }
            }
        } else if (mainBattery.state == UPowerDeviceState.Discharging) {
            let time = mainBattery.timeToEmpty;
            if (time == 0) {
                return "Getting Time to Empty...";
            } else {
                let timeArr = secondsToTime(time);
                if (timeArr.hours >= 1 || timeArr.hourNeedsIncrement == 1) {
                    finalText += timeArr.hours + "h ";
                    if (timeArr.minutesRounded >= 1) {
                        finalText += timeArr.minutes + "m";
                    }
                } else {
                    finalText += timeArr.minutes + "m " + timeArr.seconds + "s";
                }
            }
        } else {
            return "Getting Time...";
        }
        return finalText;
    }

    function secondsToTime(totalSeconds) {
        totalSeconds = Math.max(0, Number(totalSeconds));

        const hours = Math.floor(totalSeconds / 3600);
        const minutes = Math.floor((totalSeconds % 3600) / 60);
        const seconds = Math.floor(totalSeconds % 60);

        const roundedMinutes = minutes + (seconds >= 30 ? 1 : 0);
        const hourNeedsIncrement = roundedMinutes === 60;

        return {
            hours,
            minutes,
            seconds,
            minutesRounded: hourNeedsIncrement ? 0 : roundedMinutes,
            hourNeedsIncrement
        }
    }
}
