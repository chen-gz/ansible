https://learn.microsoft.com/en-us/windows/wsl/connect-usb

winget install --interactive --exact dorssel.usbipd-win

https://blog.golioth.io/program-mcu-from-wsl2-with-usb-support/

# add to uucp
usermod -aG uucp $USER

# add following code to /etc/udev/rules.d/50-stlink.rules
SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374e", MODE="0666", GROUP="plugdev"

