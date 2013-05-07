# todayPlus60.pl
# outputs date 60 days from today
# in m/d/yyyy format

perl -e '@now_andsixty = localtime(time+(60*60*60*24)); print $now_andsixty[4]+1, $now_andsixty[3], $now_andsixty[5]+1900, "\n"'

