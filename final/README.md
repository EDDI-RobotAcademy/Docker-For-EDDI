## How to use

1. sudo useradd -rm -d /home/eddi -s /bin/bash -g root -G sudo,dialout eddi  
or sudo useradd -s /bin/bash -d /home/eddi -g root -m -G sudo eddi  
2. sudo passwd eddi  
3. su eddi

## How to delete user

sudo deluser --remove-home username  
