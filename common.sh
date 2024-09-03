
currentdate=$(date +%Y%m%d-%H)

qf_path=/home/w0011/mkbd_gitee

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\033[1;33m'
BLUE='\E[1;34m'
PINK='\E[1;35m'  # 粉红
END='\033[0m'  # 清除颜色

# Check for "clean" option in the script arguments
if [[ "$@" == *clean* ]]; then
    echo -e "${GREEN}Cleaning build environment...${END}"
    rm -rf lib/*.a
    rm -rf keyboards/*.a
    echo -e "${GREEN}Cleaning Libraries...${END}"
    make clean
fi


polling_check(){
count=0
while [ ! -f E:/CURRENT.UF2 ] && [ ! -f D:/CURRENT.UF2 ]; do
    sleep 2
    count=$((count + 1))

    if [ $count -gt 50 ]; then
        echo -e "\n${RED}Beyond attempt, break current build...${END}"
        break
    fi
done
}

# Rest of your script...

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

 pconfig1=$1
 pconfig2=$2



  echo "...."

  echo "./all.sh hhkb    or     ./all.sh build_hhkb_gen"
  echo "./all.sh 30_v2lmini    or     ./all.sh  ./all.sh 33"


  echo "./all.sh 67_v2 f4 "
  echo "./all.sh 64_d2 l4    or     ./all.sh 6400 l4"
  echo "./all.sh 64_d2 f4    or     ./all.sh 6400 f4"
  echo "./all.sh 61    or     ./all.sh build_61_gen"


echo "...."




if [ "$#" -lt 2 ]; then
    echo "Error: At least two parameters are required."
    exit 1
fi

  printf "${GREEN} build_64_${pconfig1}/${pconfig2} ...$END\n"
    qfroot=pivot
    qfconfig=${pconfig1}/${pconfig2}
    qfkeymap=${pconfig1%_*}keymap

    echo "make ${qfroot}/${qfconfig}:${qfkeymap}"
    # echo "pconfig2===${pconfig2}"
    # echo "pconfig1===${pconfig1}"

    if [ "$pconfig2" = "l4" ]; then
        make ${qfroot}/${qfconfig}:${qfkeymap}
    else
        make ${qfroot}/${qfconfig}:${qfkeymap}
    fi
    #rm -rf ${qf_path}/p401
    #rm -rf ${qf_path}/p433

    echo "copying library .a to home folder"
    cp ${qf_path}/keyboards/*.a ~


    polling_check

    echo "${qf_path}/.build/${qfroot}_${pconfig1}_${pconfig2}_${qfkeymap}.uf2 to    E:/flash.uf2"
    cp ${qf_path}/.build/${qfroot}_${pconfig1}_${pconfig2}_${qfkeymap}.uf2 E:/flash.uf2



