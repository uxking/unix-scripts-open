# This should be enough to extract all email addresses from a file
# sets all the emails to lowercase
# Need to | sort | uniq to remove dups
#
# usage: awk -f email_extractor.awk <filename> | sort | uniq
{
    email_regex = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}"
    while (match($0, email_regex)) {
        # Upper and lower case
        # print substr($0, RSTART, RLENGTH)
        # change all to lowercase first
        print tolower(substr($0, RSTART, RLENGTH))
        $0 = substr($0, RSTART + RLENGTH)
    }
} 
