# optimize fix

boot was slow and disk had junk. docker + containerd alone ate 45s of boot.

## why

too many services start at boot that you never use. dead autostart apps error every login. old deb packages, unused flatpak runtimes, thumb cache, and long logs pile up.

## scripts

- `fix.sh` turns off heavy boot services, hides dead autostart apps, cleans packages, flatpak, cache, logs.
- `check.sh` shows boot hogs, disk, ram.
- `compositor.sh` tries faster compositor modes.

## use

```bash
./check.sh
./fix.sh
./compositor.sh xpresent
```

## notes

- docker still works, start by hand when you code: `sudo systemctl start docker`.
- if you need one of the turned off services back, run `sudo systemctl enable <name>`.
- compositor modes: `xpresent` is smooth, `off` is max speed with no shadows, `on` goes back to default.
