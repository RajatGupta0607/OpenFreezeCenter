#!/bin/bash

# Ensure that the ec_sys module is loaded with write support enabled
if lsmod | grep ec_sys &> /dev/null ; then
    echo "ec_sys module is already loaded."
else
    echo "Loading ec_sys module with write support enabled."
    sudo modprobe ec_sys write_support=1
fi

# Ensure the necessary settings are applied for EC read/write
if ! grep -q "options ec_sys write_support=1" /etc/modprobe.d/ec_sys.conf; then
    echo "options ec_sys write_support=1" | sudo tee /etc/modprobe.d/ec_sys.conf > /dev/null
    echo "ec_sys write support enabled in modprobe configuration."
fi

echo "Additional EC system configuration applied."
