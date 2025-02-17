#!/bin/bash

# Function to perform the ping tests and show the results
ping_tests() {
    # IP addresses of Router and ADSL Modem
    # ROUTER_IP="192.168.2.1"
    # ADSL_IP="192.168.1.1"
    TWITCH_IP="twitch.tv"
    YOUTUBE_IP="youtube.com"
    GOOGLE_IP="8.8.8.8"
    GAME_IP="4.2.2.4"

    # Number of ping attempts
    COUNT=1

    # Function to handle ping and return the result
    ping_result() {
        local IP=$1
        local RESULT=$(ping -c $COUNT $IP 2>/dev/null | tail -n 1 | awk -F'/' '{print $5}')
        if [[ -z "$RESULT" ]]; then
            echo "Ping failed"
        else
            echo "$RESULT"
        fi
    }

    # Get the ping to the Game
    GAME_PING=$(ping_result $GAME_IP)

    # Get the ping to Google
    GOOGLE_PING=$(ping_result $GOOGLE_IP)

    # Get the ping to the TWITCH_IP Modem  YOUTUBE_IP
    TWITCH_PING=$(ping_result $TWITCH_IP)
    YOUTUBE_PING=$(ping_result $YOUTUBE_IP)

    # Get the ping to the ADSL Modem
    # ADSL_PING=$(ping_result $ADSL_IP)

    # Get the ping to the Router
    # ROUTER_PING=$(ping_result $ROUTER_IP)

    # Calculate the modem delay excluding router delay if both are available
    if [[ "$ADSL_PING" != "Ping failed" && "$ROUTER_PING" != "Ping failed" ]]; then
        DIFFERENCE=$(echo "$ADSL_PING - $ROUTER_PING" | bc)
    else
        DIFFERENCE="N/A"
    fi

    # Create a message for the dialog box
    RESULTS="Google Ping: $GOOGLE_PING ms\n"
    RESULTS+="4.2.2.4 Ping: $GAME_PING ms\n"
    RESULTS+="twitch Ping: $TWITCH_PING ms\n"
    RESULTS+="youtube Ping: $YOUTUBE_PING ms\n"

    # RESULTS+="ADSL Modem Ping: $ADSL_PING ms\n" TWITCH_PING
    # RESULTS+="Router Ping: $ROUTER_PING ms\n"
    # RESULTS+="(Modem-Router): $DIFFERENCE ms"

    # Clear previous results and display new ones using dialog without OK button
    dialog --title "Ping Results" --infobox "$RESULTS" 10 50
}

# Loop to repeatedly run the ping tests every second
while true; do
    ping_tests
    sleep 1  # Run the test every 1 second
done
