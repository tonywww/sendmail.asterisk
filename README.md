# sendmail.asterisk
Asterisk Voicemail -> MP3 And IBM Bluemix Transscription.

Tested on Asterisk v13.

## Usage:

1. Copy file `sendmail.asterisk` to `/usr/sbin/`.
````
wget -O /usr/sbin/sendmail.asterisk https://raw.githubusercontent.com/tonywww/sendmail.asterisk/master/sendmail.asterisk
````

2. Set ownership to `asterisk:asterisk` and make it executable.
````
chown asterisk: /usr/sbin/sendmail.asterisk
chmod +x /usr/sbin/sendmail.asterisk
````

3. In the `[general]` section of `/etc/asterisk/voicemail.conf`, add the following line:

````
set mailcmd=/usr/sbin/sendmail.asterisk
````

4. Replace your IBM API_KEY and API_URL in `/usr/sbin/sendmail.asterisk`.
 
**More:** Make sure the asterisk user can execute (and that they exist) the following command:

(FYI: a new install of FreePBX circa March 2020, I didn't need to change or install anything.)

   * dos2unix (unix2dos)
   * sox
   * lame

## Express Install:
````
bash <(wget -qO- 'https://raw.githubusercontent.com/tonywww/sendmail.asterisk/master/sendmail.asterisk-install.sh')
````

## Specify IBM Bluemix API credentials
* follow instructions here to get key and url:

   https://cloud.ibm.com/docs/speech-to-text?topic=speech-to-text-gettingStarted

* key is long string separated by underscore(s). API_OPTS assumes US english, but there are many other language options available.

   See full API reference at:

   https://cloud.ibm.com/apidocs/speech-to-text


## License
[GPL-2.0](LICENSE) © 2021 tonywww
