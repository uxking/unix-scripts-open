#!/usr/bin/ksh
# use this to get the standard unix time broken down to use in a perl
# script to calculate epoch times
# the perl script can be found in this git repository - call timePlus.pl
# 
# 
# - mdh 1/20/2015

# usage: getEpoch.ksh <hours>

# we need to get the month in 0-11 format
convertMonth()
{
    case "$month" in
            Jan)  month=0;;
            Feb)  month=1;;
            Mar)  month=2;;
            Apr)  month=3;;
            May)  month=4;;
            Jun)  month=5;;
            Jul)  month=6;;
            Aug)  month=7;;
            Sep)  month=8;;
            Oct)  month=9;;
            Nov)  month=10;;
            Dec)  month=11;;
     esac

    echo $month
}
if (( ${#} != 1 )) ; then
    echo "Usage: getEpoch.ksh <number of hours>"
    exit 255
fi

# argument that specifies how many hours to calculate from the given time
hours=$1

# Get the values you are going to need to convert to epoch
# these can be any date, you just need to read in the values for month, day, time, and year
date | awk '{print $2, $3, $4, $6}' | read month day time year

mth=$(convertMonth $month)

echo "Month, Day and Year are: $mth $day $time $year"

# set time to two variables (hour and minute)
echo $time | awk 'FS=":" {print $1, $2}' | read hour minute
echo "The hours and minutes for the newest file are: $hour $minute"

./timePlus.pl -hours=$hours -minute=$minute -hour=$hour -month=$month -day=$day -year=$year
