#!/bin/bash


# TERMINAL COLORS -----------------------------------------------------------------
NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
BLACK='\033[30m'
BLUE='\033[34m'
VIOLET='\033[35m'
CYAN='\033[36m'
GREY='\033[37m'

# VARIABLES -----------------------------------------------------------------------
groups_index=()
groups_name=()
groups_id=()


# FUNCTIONS ======================================================================

function run_until () {
    re=^[a-zA-Z-_]$
    while [[ "$1" =~ ${re} ]]; do 
        echo "NON compliant name.. try again"
    done
}

function fatal_error {
    echo -e "${RED}FATAL ERROR${NONE}"
    echo $1
}

# Check if IP address is valid  
function validate_IP {
        local ip=$1
	local stat=1
	# Check the IP address under test to see if it matches the extended REGEX

	if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
		# Record current default field separator
		OIFS=$IFS
		# Set default field separator to .
		IFS='.'
		# Create an array of the IP Address being tested
		ip=($ip)
		# Reset the field separator to the original saved above IFS=$OIFS
		# Is each octet between 0 and 255?
		[[ ${ip[0]} -le 255 && ${ip[1]} -le 255 && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
		# Set the return code.
		stat=$?
	fi
}

# MAIN SETUP
function run_setup {
    echo "running setup...."
    echo ""  
    
    echo -e "Enter ${GREEN}Project name${NONE}"
    read PROJECT_NAME

    # TODO change to while
    run_until ${PROJECT_NAME}
    echo -e "your project name is ${YELLOW}${PROJECT_NAME}${NONE}"    
}


# MAIN -----------------------------------------------------------------------------------------

echo "---------------------------------------------------------------------------------"
echo "ANSIBLE PROJECT GENERATOR"    
echo "---------------------------------------------------------------------------------------"
echo "ansible project generator. https://github.com/pietaridaemonna/ansible_project_generator"
echo "---------------------------------------------------------------------------------------"

while getopts ":pdq:" optname
  do
    case "$optname" in
      "d")
        echo -e "${GREY}using dynamic directory${NONE}"
        ;;
      "q")
        echo "Option $optname has value $OPTARG"
        ;;
      "?")
        echo "sdlkjf"
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        ;;
      *)
      # Should not occur
        echo "Unknown error while processing options"
        ;;
    esac
  done

if [ $OPTIND -eq 1 ]; then echo "No options were passed";
    run_setup
fi


exit $?


