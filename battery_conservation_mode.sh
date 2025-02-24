#!/bin/bash

turn_on() {
    echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x03' | sudo tee /proc/acpi/call > /dev/null
    echo "Conservation Mode ON"
}

turn_off() {
    echo '\_SB.PCI0.LPC0.EC0.VPC0.SBMC 0x05' | sudo tee /proc/acpi/call > /dev/null
    echo "Conservation Mode OFF"
}

check_status() {
    echo '\_SB.PCI0.LPC0.EC0.BTSM' | sudo tee /proc/acpi/call > /dev/null
    sudo cat /proc/acpi/call; printf '\n'
}

case "$1" in
    "on")
        turn_on
        ;;
    "off")
        turn_off
        ;;
    "status")
        check_status
        ;;
    *)
        echo "Usage: $0 {on|off|status}"
        exit 1
        ;;
esac
