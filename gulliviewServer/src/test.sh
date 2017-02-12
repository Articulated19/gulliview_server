#Script for starting all 4 cameras
#put this in the build folder

#If two arugments are passed, assume first IP and second port
#If one argument is passed, assume that it's IP and use standard port 2020
#If no argument is passed, start with standard ip and port

if [ $# -eq 2 ]
then
  echo "2 args"
  ./GulliView -d 0 -f Tag16h5 -W 960 -H 540 -V $1 -N $2
  ./GulliView -d 1 -f Tag16h5 -W 960 -H 540 -V $1 -N $2
  ./GulliView -d 2 -f Tag16h5 -W 960 -H 540 -V $1 -N $2
  ./GulliView -d 3 -f Tag16h5 -W 960 -H 540 -V $1 -N $2
  echo "ip: $1"
  echo "port: $2"
elif [ $# -eq 1  ]
then
  ./GulliView -d 0 -f Tag16h5 -W 960 -H 540 -V $1
  ./GulliView -d 1 -f Tag16h5 -W 960 -H 540 -V $1
  ./GulliView -d 2 -f Tag16h5 -W 960 -H 540 -V $1
  ./GulliView -d 3 -f Tag16h5 -W 960 -H 540 -V $1
else
  ./GulliView -d 0 -f Tag16h5 -W 960 -H 540
  ./GulliView -d 1 -f Tag16h5 -W 960 -H 540
  ./GulliView -d 2 -f Tag16h5 -W 960 -H 540
  ./GulliView -d 3 -f Tag16h5 -W 960 -H 540
fi
