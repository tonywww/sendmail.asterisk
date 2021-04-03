# sendmail.asterisk
Asterisk Voicemail -> MP3 And IBM Bluemix Transscription.

Tested on Asterisk v13.

## Usage:
copy this file to /usr/sbin/ set ownership to asterisk:asterisk and make it executable.

    In the [general] section of /etc/asterisk/voicemail.conf
    set mailcmd=/usr/sbin/sendmail.asterisk

Permissions - More: Make sure the asterisk user can execute (and that they exist - fwiw, a new 
                    install of FreePBX circa March 2020, I didn't need to change or install anything):
   * dos2unix (unix2dos)
   * sox
   * lame





## Specify IBM Bluemix API credentials
follow instructions here to get key and url
https://cloud.ibm.com/docs/speech-to-text?topic=speech-to-text-gettingStarted

key is long string separated by underscore(s). API_OPTS assumes US english, but there are many other language options available
see full API reference at: https://cloud.ibm.com/apidocs/speech-to-text


## License
[GPL-2.0](LICENSE) © 2021 tonywww
