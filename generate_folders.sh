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
}


# MAIN -----------------------------------------------------------------------------------------

echo "---------------------------------------------------------------------------------"
echo "ANSIBLE PROJECT GENERATOR"    
echo "---------------------------------------------------------------------------------------"
echo "ansible project generator. https://github.com/pietaridaemonna/ansible_project_generator"
echo "---------------------------------------------------------------------------------------"

while getopts ":pq:" optname
  do
    case "$optname" in
      "p")
        echo "Option $optname is specified"
        ;;
      "q")
        echo "Option $optname has value $OPTARG"
        ;;
      "?")
        echo "Unknown option $OPTARG"
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        run_setup
        ;;
      *)
      # Should not occur
        echo "Unknown error while processing options"
        ;;
    esac
  done



exit $?


