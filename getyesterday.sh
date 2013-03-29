# getyesterday.sh

# fuctions getyesterday() subtracts one from todays day
# if zero, uses the last day of the last month as yesterday
# does not break durring a leap year   - mdh 3/2/1

getyesterday() {


    check_leap_year() {

        year=`date +%Y`
        if [ `echo $year%4 | bc` = 0 ] && [ `echo $year%100 | bc` -gt 0 ]
        then
	    return 0   # leapyear
	else
	    return 1   # non leapyear
        fi 
    }

    month=`date +%b`
    day=`date +%d`
    typeset -i yesterday=`echo $day-1 | bc`

    if [ $yesterday = 0 ]
    then
        case "$month" in
          Jan)  yesterday=31; month=Dec;;
	    Feb)  yesterday=31; month=Jan;;
	    Mar)  month=Feb
	          if (check_leap_year)
	          then
	              yesterday=29
	          else
		      yesterday=28
	          fi;;
	    Apr)  yesterday=31; month=Mar;;
	    May)  yesterday=30; month=Apr;;
	    Jun)  yesterday=31; month=May;;
	    Jul)  yesterday=30; month=Jun;;
	    Aug)  yesterday=31; month=Jul;;
	    Sep)  yesterday=31; month=Aug;;
	    Oct)  yesterday=30; month=Sep;;
	    Nov)  yesterday=31; month=Oct;;
	    Dec)  yesterday=30; month=Nov;;
        esac
    fi
    typeset -Z2 yesterday
    echo $month $yesterday
}

reportdate=`getyesterday`
echo $reportdate

