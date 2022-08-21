# F´ MPL3225A2 App

This is an example F´ application driver for an I2C sensor, the mpl3115a2. This
example is specifically built for the raspberry pi but with the creation of a new toolchain, this application should work on any linux system.

## Building

1. Run `git clone --recurse-submodules` to checkout this repository and its submodules.
2. If you're cross compiling, change the default toolchain in `MPL3115A2_App/settings.ini` to the correct
   target (ex. `raspberrypi`).
3. In the `MPL3115A2_App` directory, run `fprime-util generate`, then `fprime-util build` to build the app.

## Running

The `MPL3115A2_App` binary will be in the `bin` directory and after copying to the target can be run directly.
This needs to be updated once we actually run on hardware. /dev/ttyUSB0 serial port used as demonstration in the example code below. The `-d` argument can be used to manually set the serial port if needed. The `-a` sets the location of the GDS to connect
to.

```shell
# On target
$ ./MPL3115A2_App -a <GDS IP> -d /dev/ttyUSB0
# On host computer
$ fprime-gds -n --dictionary MPL3115A2_App/Top/GpsAppTopologyAppDictionary.xml
```

