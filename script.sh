
!/bin/bash

if [ "$(docker ps -q -f name=mycontainer)" ]
then 
    echo "Container is working fine"

elif [ "$(docker ps -aq -f status=exited -f name=mycontainer)" ]
then 
    echo "Container is paused. Restarting it..."
    docker start mycontainer

elif [ "$(docker ps -aq -f status=running -f name=mycontainer)" ]
then
    echo "Container is paused. Restarting it..."
    docker unpause mycontainer

else
    echo "Container doesn't exist, Creating it..."
    docker run -d --name mycontainer myapp-image:tag
fi
