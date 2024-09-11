#!/bin/bash

# Ensure that the EC system module is loaded with write support enabled.
if lsmod | grep ec_sys &> /dev/null ; then
    echo "ec_sys module is already loaded."
else
    echo "Loading ec_sys module with write support enabled."
    sudo modprobe ec_sys write_support=1
fi

# Add ec_sys to be loaded on boot
if ! grep -q "ec_sys" /etc/modules-load.d/ec_sys.conf; then
    echo "ec_sys" | sudo tee -a /etc/modules-load.d/ec_sys.conf > /dev/null
    echo "ec_sys module added to load on boot."
fi

echo "EC read/write system preparation complete."
