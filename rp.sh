
#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to print colored text
print() {
    echo -e "${GREEN}$1${NC}"
}

polling_check(){
count=0
while [ ! -f E:/INFO_UF2.TXT ]; do
    sleep 2
    count=$((count + 1))

    if [ $count -gt 50 ]; then
        echo "\nBeyong attempt, break current build..."
        break
    fi

    if (( count == 1 )); then
        echo "E:/INFO_UF2.TXT can't find, polling check...every 2 seconds"
        echo -n "Detecting..."
        continue
    fi

    echo -n "."

done
}


print "cd examples/build"
cd examples/build
export PICO_SDK_PATH=/home/dellht/Pico-PIO-USB/examples/pico-sdk
print "runing cmake .."
cmake ..

# Use the function
print "running ninja .."
ninja

polling_check
cp /home/dellht/Pico-PIO-USB/examples/build/capture_hid_report/capture_hid_report.uf2 E:/
echo "Flashing successful...."