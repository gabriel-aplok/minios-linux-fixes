# wallpaper fix

desktop was all black. no wallpaper, no icons. config was fine, just nothing drew it.

## why

xfdesktop was not running. that is the app that draws the wallpaper and icons. old saved session had no xfdesktop in it, so every login loaded a desktop with nothing to draw.

## scripts

- `fix.sh` starts xfdesktop in the back and reloads the wallpaper.
- `check.sh` shows if xfdesktop runs and what image it should draw.

## use

```bash
./fix.sh
./check.sh
```

then log out once with save session checked while the wallpaper shows.

## permanent

the saved session keeps missing xfdesktop. `autostart.sh` adds an autostart
entry so xfdesktop starts on every login and the wallpaper never goes black
again:

```bash
./autostart.sh
```
