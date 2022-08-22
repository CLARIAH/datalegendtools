#!/bin/sh

echo "Initiating DataLegend container..."

sudo docker-compose up -d datalegend
sleep 10

echo "Opening web interface..."

xdg-open http://localhost:3000/wetty

echo "Please login with\nuser: datalegend\npass: datalegend\n"

echo "Press any key to stop the container"
read 

quit='n'
while [ "$quit" != 'y' ] && [ "quit" != 'Y' ] && [ "quit" != "yes" ]
do
    "Stop container? (y/[n]): "
    read quit
done

sudo docker stop datalegend

exit 0
