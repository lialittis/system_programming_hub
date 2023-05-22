
# Variable in string
VALUE_STR="32"

RES=$(echo "$VALUE_STR > 50" | bc)
echo $RES

RES2=$(expr $VALUE_STR \> 50)
echo $RES2
