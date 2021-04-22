cat << EOF
#
# sendmail.asterisk-install.sh
#
# This shell scipts will install
# Asterisk voicemail to MP3 And IBM Bluemix Transscription
#
# THIS IS IMPORTANT!  You must run the entire process as "root"!
#
# Before the installation, please apply the IBM Bluemix API first.
# follow instructions here to get key and url:
# https://cloud.ibm.com/docs/speech-to-text?topic=speech-to-text-gettingStarted
# key is long string separated by underscore(s). API_OPTS assumes US english, but there are many other language options available
# see full API reference at: https://cloud.ibm.com/apidocs/speech-to-text#
#
# Make sure the asterisk user can execute (and that they exist):
# * dos2unix   * unix2dos   * sox   * lame
#
EOF
read -p "Please press \"y\" to continue: " answer

case $answer in
    Y|y)
    echo "continue..."

read -p "Please input your IBM API_KEY: " apikey
read -p "Please input your IBM API_URL: " apiurl

# download sendmail.asterisk to /usr/sbin
wget -O /usr/sbin/sendmail.asterisk https://raw.githubusercontent.com/tonywww/sendmail.asterisk/master/sendmail.asterisk

sed -i 's/\(^API_KEY="\).*/\1$apikey"/' /usr/sbin/sendmail.asterisk
sed -i 's/\(^API_URL="\).*/\1$apiurl"/' /usr/sbin/sendmail.asterisk

chown asterisk: /usr/sbin/sendmail.asterisk
chmod +x /usr/sbin/sendmail.asterisk

sed -i '/^mailcmd=/d' /etc/asterisk/voicemail.conf 
sed -i '/\[general\]/a\mailcmd=/usr/sbin/sendmail.asterisk' /etc/asterisk/voicemail.conf 

fwconsole reload
echo "sendmail.asterisk install completed!"

## go exit
    ;;


## end    
    *)
    echo "exit"
    ;;

esac

exit 0
