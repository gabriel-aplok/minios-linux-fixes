# window manager fix

every login gave a broken desktop. no title bars, no borders, no resize.

## why

the saved xfce session had no xfwm4 in it. only panel, settings, thunar, power manager. xfce loads that broken state on every login. also plain `xfwm4 --replace &` dies when you close the terminal.

## scripts

- `fix.sh` restarts xfwm4 in the back and checks it.
- `check.sh` shows window manager state.
- `clear-session.sh` deletes the broken saved session.

## use

```bash
./fix.sh
./check.sh
./clear-session.sh
```

then log out once with save session checked while xfwm4 runs. next login is fine.

## bash alias

```bash
alias fixwm='nohup xfwm4 --replace > /tmp/xfwm4-replace.log 2>&1 & disown; sleep 1; wmctrl -m'
alias wm-check='wmctrl -m; ps aux | grep -E "[x]fwm4"'
```
