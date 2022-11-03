# Steps to recreating firefox

- login to firefox account, this will sinc extensions and bookmarks
- hide tabs
- - go to `about:config`, and change the value of `toolkit.legacyUserProfileCustomizations.stylesheets` to true
- - go to `about:profiles` and open the profile dir (root)
- - in the profile dir paste the 'chrome' dir
- set sidebery
- - import the config `sidebery-data.json`
- set adblocker white list
- - AdBlocler Ultimate > settings > white list and import `whitelist.txt`
