#!/bin/bash
YELLOW='\033[0;33m'
LIGHT_YELLOW='\033[1;33m'
DARK_YELLOW='\033[0;33m'
PINK='\033[1;35m'
GREEN='\033[0;32m'
LIGHT_GREEN='\033[1;32m'
RED='\033[0;31m'  # ANSI escape code for red color
NC='\033[0m'      # ANSI escape code for reset (to default color)

# Define the function to process each line
process_line_full() {
    line_raw="$1"
    file="$2"
    full_testing="$3"

    # If you want to change the number of turns philosophers should eat, change the "turns" variable
    turns=20
    line="${line_raw} $turns"

    # Split the line into an array of arguments
    read -r -a args <<< "$line"

    # Check if there are less than 3 arguments
    if (( ${#args[@]} < 3 )); then
        echo "Error: Line '$line' does not contain enough arguments"
        return 1
    fi

    ko_detected=0

    for ((i=0; i<4; i++)); do
        # Call philosopher with the arguments
        output=$(.././philosopher "${args[@]}")

        # Check conditions based on the output and the filename
        if grep -q "died" <<< "$output" && [[ $file == *"test_input_not_die.txt"* ]]; then
            echo "$output" > "./test_logs/not_die/${line}.txt"
            ko_detected=$((ko_detected+1))
        elif ! grep -q "died" <<< "$output" && [[ $file == *"test_input_die.txt"* ]]; then
            echo "$output" > "./test_logs/die/${line}.txt"
            ko_detected=$((ko_detected+1))
        fi
    done

    # echo "final $ko_detected"
    
    if (( ko_detected > 2 )); then
        if [[ $file == *"test_input_not_die.txt"* ]]; then
            echo -e "'$line' ${RED}KO${NC} Philosophers must not die: $ko_detected/4 died"
        elif [[ $file == *"test_input_die.txt"* ]]; then
            echo -e "'$line' ${RED}KO${NC} Philosophers expected to die: $ko_detected/4 did not die"
        fi
    else
        if [[ $file == *"test_input_not_die.txt"* ]]; then
            echo -e "'$line' ${LIGHT_GREEN}OK${NC}: $ko_detected/4 died"
        elif [[ $file == *"test_input_die.txt"* ]]; then
            echo -e "'$line' ${LIGHT_GREEN}OK${NC}: $ko_detected/4 survived"
        fi
    fi
}

# Define the function to process each line
process_line_short() {
    line_raw="$1"
    file="$2"
    full_testing="$3"

    # If you want to change the number of turns philosophers should eat, change the "turns" variable
    turns=20
    line="${line_raw} $turns"

    # Split the line into an array of arguments
    read -r -a args <<< "$line"

    # Check if there are less than 3 arguments
    if (( ${#args[@]} < 3 )); then
        echo "Error: Line '$line' does not contain enough arguments"
        return 1
    fi

    ko_detected=0

    # Call philosopher with the arguments
    output=$(.././philosopher "${args[@]}")

    # Check conditions based on the output and the filename
    if grep -q "died" <<< "$output" && [[ $file == *"test_input_not_die.txt"* ]]; then
        echo "$output" > "./test_logs/not_die/${line}.txt"
        ko_detected=1
    elif ! grep -q "died" <<< "$output" && [[ $file == *"test_input_die.txt"* ]]; then
        echo "$output" > "./test_logs/die/${line}.txt"
        ko_detected=1
    fi

    # echo "final $ko_detected"
    
    if (( ko_detected==1 )); then
        if [[ $file == *"test_input_not_die.txt"* ]]; then
            echo -e "'$line' ${RED}KO${NC} Philosophers must not die"
        elif [[ $file == *"test_input_die.txt"* ]]; then
            echo -e "'$line' ${RED}KO${NC} Philosophers expected to die"
        fi
    else
        echo -e "'$line' ${LIGHT_GREEN}OK${NC}"
    fi
}

# Main script execution
full_testing=0
if [[ "$1" == "-f" ]]; then
    full_testing=1
    echo -e "       ${PINK}Each test case will be sent 4 times${NC}"
    for file in ../test/test_input/*; do
        if [ -f "$file" ]; then  # Check if it's a regular file
            echo "Processing file: $file"
            while IFS= read -r line; do
                process_line_full "$line" "$file" "$full_testing"
            done < "$file"
        fi
    done
else
    echo -e "       ${LIGHT_YELLOW}Each test case will be sent 1 time${NC}"
    for file in ../test/test_input/*; do
        if [ -f "$file" ]; then  # Check if it's a regular file
            echo "Processing file: $file"
            while IFS= read -r line; do
                process_line_short "$line" "$file" "$full_testing"
            done < "$file"
        fi
    done
fi
