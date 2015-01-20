#!/usr/bin/ksh
# use this to get the standard unix time broken down to use in a perl
# script to calculate epoch times
# the perl script can be found in this git repository
# - mdh 1/20/2015

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

hours=$1

#Get the values you are going to need to convert to epoch
date | awk '{print $2, $3, $4, $6}' | read month day time year

mth=$(convertMonth $month)

echo "Month, Day and Year are: $mth $day $time $year"

# set time to two variables (hour and minute)
echo $time | awk 'FS=":" {print $1, $2}' | read hour minute
echo "The hours and minutes for the newest file are: $hour $minute"

./mhPlusTime.pl -hours=$hours -minute=$minute -hour=$hour -month=$month -day=$day -year=$year
