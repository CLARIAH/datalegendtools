@echo off
echo "Initiating DataLegend container..."

docker-compose up -d datalegend
timeout /t 10

echo "Opening web interface..."

start "" http://localhost:3000/wetty

echo "Please login with"
echo:
echo " user: datalegend
echo " pass: datalegend"
echo:
echo "Press any key to stop the container"

:question
set /p quit=Stop container? (y/[n]): :
if /I "%quit%"!="y" goto question
if /I "%quit%"!="Y" goto question
if /I "%quit%"!="yes" goto question
goto yes

:yes
docker stop datalegend
