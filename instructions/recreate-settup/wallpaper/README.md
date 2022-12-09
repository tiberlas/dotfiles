To change the wallpaper periodically create a cron job.

in cli type: `crontab -e`
or type to select the editor: `export VISUAL=vim;crontab -e`
then paste this script:
```
WALLPAPER_PATH="/home/tiberius/pictures/pastel-girls"
# refres wallpaper on 10,11 and 12 min
*/10 * * * * DISPLAY=:0 nitrogen --set-centered --set-color=#000 --random $WALLPAPER_PATH --head=0
*/11 * * * * DISPLAY=:0 nitrogen --set-centered --set-color=#000 --random $WALLPAPER_PATH --head=1
```

