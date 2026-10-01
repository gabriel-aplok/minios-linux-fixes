# optimize fix

boot was slow and disk had junk. docker + containerd alone ate 45s of boot.

## why

too many services start at boot that you never use. old deb packages, unused flatpak runtimes, thumb cache, and long journal logs pile up.

## scripts

- `fix.sh` turns off heavy boot services, cleans packages, flatpak, cache, logs.
- `check.sh` shows boot hogs, disk, ram.

## use

```bash
./check.sh
./fix.sh
```

## notes

- docker still works, start by hand when you code: `sudo systemctl start docker`.
- if you need one of the turned off services back, run `sudo systemctl enable <name>`.
