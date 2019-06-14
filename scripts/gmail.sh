USER=Your_Gmail_Username
PASS=Your_Password
 
COUNT=`curl -su $USER:$PASS https://mail.google.com/mail/feed/atom || echo "<fullcount>unknown number of</fullcount>"`
COUNT=`echo "$COUNT" | grep -oPm1 "(?<=<fullcount>)[^<]+" `
echo $COUNT
if [ "$COUNT" != "0" ]; then
    if [ "$COUNT" = "1" ];then
        WORD="mail";
    else
        WORD="mails";
    fi
fi