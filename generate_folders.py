#!/usr/bin/python3

s= """#  ___            _ _     _        _____                           _             
# / _ \          (_) |   | |      |  __ \                         | |            
#/ /_\ \_ __  ___ _| |__ | | ___  | |  \/ ___ _ __   ___ _ __ __ _| |_ ___  _ __ 
#|  _  | '_ \/ __| | '_ \| |/ _ \ | | __ / _ \ '_ \ / _ \ '__/ _` | __/ _ \| '__|
#| | | | | | \__ \ | |_) | |  __/ | |_\ \  __/ | | |  __/ | | (_| | || (_) | |   
#\_| |_/_| |_|___/_|_.__/|_|\___|  \____/\___|_| |_|\___|_|  \__,_|\__\___/|_|   
#    """                                                                            

import os
import re
from pathlib import Path 

print(s)

current = os.getcwd()
os.chdir( current )


# Get user's project_name
project_name = input("Please enter project_name of project: ")

# While project_name has incorrect characters
while re.search('[^a-zA-Z\d\_\n]',project_name):

    # Print out an error
    print("illegal project_name - Please use only letters")

    # Ask for the project_name again (if it's incorrect, while loop starts again)
    project_name = input("Please enter project_name of project: ")

os.makedirs(project_name)
os.chdir(project_name)
    

# Get user's inventory_type
inventory_type = input("Please enter inventory_type [static/dynamic]: ")

# While inventory_type has incorrect characters
while re.search('[^\bstatic\b | \bdynamic\b\n]',inventory_type):

    # Print out an error
    print("illegal inventory_type - Please use only static OR dynamic")

    # Ask for the inventory_type again (if it's incorrect, while loop starts again)
    inventory_type = input("Please enter inventory_type of project: ")








# FUNCTIONS ---------------------------------------------------------------------





