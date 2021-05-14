# Battery status job
Sends notifications to plug in/unplug power source when not between 40-80%. <br/><br/>

**Get the path of your bash job:**

```pwd```   

e.g /Users/joanna/scripts/battery_status.sh <br/><br/>


**Go into LaunchAgents folder:**

```cd $HOME/Library/LaunchAgents```  <br/><br/>

**Create `.plist` file for the job (example in this folder):**

```vim com.joanna.batterystatus.plist``` <br/><br/>

**Load the job**

```launchctl load com.joanna.batterystatus.plist```<br/><br/>

### References

Script:
https://apple.stackexchange.com/questions/116429/using-bash-terminal-to-get-number-of-battery-recharge-cycles
https://stackoverflow.com/questions/21249419/how-do-i-programatically-detect-if-my-laptop-is-plugged-in-or-not-osx
https://askubuntu.com/questions/518928/how-to-write-a-script-to-listen-to-battery-status-and-alert-me-when-its-above

Cron job:
https://alvinalexander.com/mac-os-x/mac-osx-startup-crontab-launchd-jobs/
https://apple.stackexchange.com/questions/29056/launchctl-difference-between-load-and-start-unload-and-stop
