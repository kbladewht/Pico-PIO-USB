
#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to print colored text
print() {
    echo -e "${GREEN}$1${NC}"
}

export PICO_SDK_PATH=/home/dellht/Pico-PIO-USB/examples/pico-sdk

print "cd pico-examples/build"
cd pico-examples/build
print "runing cmake .."
cmake ..

# Use the function
print "running ninja .."
ninja
echo "end"

cp /home/dellht/Pico-PIO-USB/pico-examples/build/hello_world/usb/*.uf2 E:/