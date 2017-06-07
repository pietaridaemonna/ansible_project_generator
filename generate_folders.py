#  ___            _ _     _        _____                           _             
# / _ \          (_) |   | |      |  __ \                         | |            
#/ /_\ \_ __  ___ _| |__ | | ___  | |  \/ ___ _ __   ___ _ __ __ _| |_ ___  _ __ 
#|  _  | '_ \/ __| | '_ \| |/ _ \ | | __ / _ \ '_ \ / _ \ '__/ _` | __/ _ \| '__|
#| | | | | | \__ \ | |_) | |  __/ | |_\ \  __/ | | |  __/ | | (_| | || (_) | |   
#\_| |_/_| |_|___/_|_.__/|_|\___|  \____/\___|_| |_|\___|_|  \__,_|\__\___/|_|   
#                                                                                

import os
from pathlib import Path  #needs python 3.5+
import re


# Get user's project_name
project_name = raw_input("Please enter project_name of project: ")

# While project_name has incorrect characters
while re.search('[^a-zA-Z\n]',project_name):

    # Print out an error
    print("illegal project_name - Please use only letters")

    # Ask for the project_name again (if it's incorrect, while loop starts again)
    project_name = raw_input("Please enter project_name of project: ")
    

# Get user's inventory_type
inventory_type = raw_input("Please enter inventory_type [static/dynamic]: ")

# While inventory_type has incorrect characters
while re.search('[^a-zA-Z\n]',inventory_type):

    # Print out an error
    print("illegal inventory_type - Please use only letters")

    # Ask for the inventory_type again (if it's incorrect, while loop starts again)
    inventory_type = raw_input("Please enter inventory_type of project: ")






# base directories

path = Path('INVENTORIES')  # we'll have production, staging/test, dev
path.parent.mkdir(parents=True, exist_ok=True) 
path = Path('INVENTORIES/production')
path.parent.mkdir(parents=True, exist_ok=True) 
path = Path('INVENTORIES/test')
path.parent.mkdir(parents=True, exist_ok=True) 
path = Path('INVENTORIES/dev')
path.parent.mkdir(parents=True, exist_ok=True) 

path = Path('LIBRARY')      # if any custom modules, put them here (optional)
path.parent.mkdir(parents=True, exist_ok=True) 

path = Path('ROLES')
path.parent.mkdir(parents=True, exist_ok=True) 


# FUNCTIONS ---------------------------------------------------------------------

def touch(fname, mode=0o666, dir_fd=None, **kwargs):
    flags = os.O_CREAT | os.O_APPEND
    with os.fdopen(os.open(fname, flags=flags, mode=mode, dir_fd=dir_fd)) as f:
        os.utime(f.fileno() if os.utime in os.supports_fd else fname,
            dir_fd=None if os.supports_fd else dir_fd, **kwargs)


