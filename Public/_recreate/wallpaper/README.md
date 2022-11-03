To change the wallpaper periodically create a cron job.

in cli type: `crontab -e`
then paste this script:
```
# refres wallpaper on 10,11 and 12 min
*/10 * * * * DISPLAY=:0 nitrogen --set-zoom --set-color=#000 --random /home/t.tapai/Pictures/retro2D --head=0
*/11 * * * * DISPLAY=:0 nitrogen --set-zoom --set-color=#000 --random /home/t.tapai/Pictures/retro2D --head=1
*/12 * * * * DISPLAY=:0 nitrogen --set-zoom --set-color=#000 --random /home/t.tapai/Pictures/retro2D --head=2
```

