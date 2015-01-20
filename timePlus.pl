#!/usr/bin/perl -s
# perl script to add x number of hours to the current time
# script can be modified to add days, years, or seconds
# script can also be modified to take an alternate time in epoch format
# script prints time as array elements and as ctime format, comment out the unwanted format
- mdh 1/20/2015

#usage: timePlus.pl -hours=<num of hours> -minute=<0-59> -hour=<0-23> -day=<1-31> -month=<0-11> -year=<4 digit year>


use Time::Local;

$plus=$hours*60*60;

@now_plus = localtime(time+($plus));
$now_string = localtime(time+($plus));

print "Get individual array elements plus $hours hours \n";
print $now_plus[4]+1, "/",  $now_plus[3], "/", $now_plus[5]+1900, " ",  $now_plus[2], ":", $now_plus[1], "\n";
print "Now print the date in ctime format plus $hours hours \n";
print $now_string, "\n" ;

# get epoch time from a time passed in

# need sec (always 0), minute, hour, day, month(0-11), year - pass this to timelocal to get epoch

$epoch_time = timelocal(0, $minute, $hour, $day, $month, $year);
print "epoch time of time passed in from shell command arugments \n";
print $epoch_time, "\n";


$mytime = localtime($epoch_time);
print "time passed in - human readable format \n";
print $mytime, "\n";

