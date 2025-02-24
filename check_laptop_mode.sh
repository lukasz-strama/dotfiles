#!/bin/bash

echo '\_SB.PCI0.LPC0.EC0.GZ44' | sudo tee /proc/acpi/call > /dev/null
sudo cat /proc/acpi/call; printf '\n'
