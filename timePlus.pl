#!/usr/bin/perl -s
# perl script to add x number of hours to the current time
# script can be modified to add days, years, or seconds
# script can also be modified to take an alternate time in epoch format
# script prints time as array elements and as ctime format, comment out the unwanted format
- mdh 1/20/2015

#usage: timePlus.pl -hours=12 


$plus=$hours*60*60;

@now_plus = localtime(time+($plus));
$now_string = localtime(time+($plus));

print "Get individual array elements \n";
print $now_plus[4]+1, "/",  $now_plus[3], "/", $now_plus[5]+1900, " ",  $now_plus[2], ":", $now_plus[1], "\n";
print "Now print the date in ctime format \n";
print $now_string, "\n" ;
