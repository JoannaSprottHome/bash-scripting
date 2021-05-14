#!/bin/bash

battery_level=`ioreg -l | awk '$3~/Capacity/{c[$3]=$5}END{OFMT="%.3f";max=c["\"MaxCapacity\""];print(max>0?100*c["\"CurrentCapacity\""]/max:"?")}'`
battery_int=${battery_level%.*}
battery_int_adj=$((battery_int+5))
echo "Battery level: ${battery_int_adj}%"

if [[ $(pmset -g ps | head -1) =~ "AC Power" ]]; then
  echo "Logging Power Status: Power source detected."
  if [ $battery_int_adj -ge 80 ]; then
     osascript -e 'display notification "Battery is above 80%. Please remove charging cable."'
  fi
else
  echo "Logging Power Status: No power source detected. Using battery." 
  if [ $battery_int -le 40 ]; then
     osascript -e 'display notification "Battery is below 40%. Please plug in charger"'
  fi
fi


