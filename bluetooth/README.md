# bluetooth auto on fix

bluetooth was on at every boot and i never asked for it.

## why

bluez powers all adapters by default. the bluetooth service starts at boot and turns the adapter on.

## scripts

- `fix.sh` turns auto power off in the config and kills power now.
- `check.sh` shows if bluetooth is on or off.

## use

```bash
./fix.sh
./check.sh
```

should say `Powered: no`. the service still runs but the adapter stays off till you turn it on.

## extra

to kill the daemon fully:

```bash
sudo systemctl disable bluetooth
```
