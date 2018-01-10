#!/bin/bash

#for backgound and detatch: ./starter.sh > out 2>&1 &!


# First parameter in list is starting index in DB, then end index in DB then fetched rows per execution of cablint (10000 require ~16GB RAM; Reason being that the streaming of the rows does not work properly and the memory is not freed)
for i in {0..70307482..10000}
do 

    echo ">>> ""$i";
    ruby -I lib:ext bin/cablint "$i" 10000;
    wait;
    sleep 1;
done


echo "ALL DONE"
