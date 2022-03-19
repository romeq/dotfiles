battery="BAT1" # replace your battery here
battery_capacity="$(cat /sys/class/power_supply/$battery/capacity)"
battery_status="$(cat /sys/class/power_supply/$battery/status)"
model="$(cat /sys/class/power_supply/$battery/model_name | awk '{print $1" "$2}' | xargs)"

if [ "$battery_status" != "Charging" ]; then
    if [ "$battery_capacity" -lt 10 ]; then
        printf ""
    elif [ "$battery_capacity" -lt 20 ]; then
        printf ""
    elif [ "$battery_capacity" -lt 30 ]; then
        printf ""
    elif [ "$battery_capacity" -lt 40 ]; then
        printf ""
    elif [ "$battery_capacity" -lt 50 ]; then
        printf ""
    elif [ "$battery_capacity" -lt 60 ]; then
        printf ""
    elif [ "$battery_capacity" -lt 70 ]; then
        printf ""
    elif [ "$battery_capacity" -lt 80 ]; then
        printf ""
    elif [ "$battery_capacity" -lt 90 ]; then
        printf ""
    elif [ "$battery_capacity" -lt 100 ]; then
        printf ""
    fi
else 
    printf ""
fi

if [ "$battery_status" != "Unknown" ]; then
    echo " $model: $battery_status ($battery_capacity%)"
else
    echo " $model: $battery_capacity%"
fi
