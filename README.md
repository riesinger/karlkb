# KarlKB

The KarlKB is a wireless, split, 6x3+2 mechanical keyboard.
It features:

- nice!nano v2 microcontrollers (wireless, running [ZMK](https://github.com/riesinger/zmk-config))
- pads & through holes for a JST battery connector
- a power switch
- a reset buttons
- 3 rows with 6 keys each and 2 thumb keys per half
- _no OLED_ ⚡
- _no RGB anywhere_ ⚡️
  \_ _no TRRS jacks_ 📶

It is in fact my first custom keyboard and is currently still **WIP**.

## Hardware

The PCB layout is built with [Ergogen](https://github.com/ergogen/ergogen). The [`karlkb.yaml`](./karlkb.yaml) file is used as input.
The generated PCB layout is then routed with KiCad (6 and above).

To generate the PCB files with Ergogen, do

```sh
cd ergogen
npm install
node src/cli.js ../karlkb.yaml
```

You should now see and `output` folder, which contains a KiCad PCB. Route this PCB and send it off to be manufactured.

## Software

This keyboard uses ZMK as its firmware. See my [zmk-config](https://github.com/riesinger/zmk-config) repository for the corresponding configuration.

## Thanks to

- [Ben Vallack](https://github.com/benvallack) for exposing me to Ergogen (even though his tutorial is not really comprehensive 😉)
- [The Ergogen devs](https://github.com/ergogen/ergogen/graphs/contributors). Without them, these keys would never have been straight!
- [The ZMK devs](https://github.com/zmkfirmware/zmk/graphs/contributors) for providing an awesome and customizable wireless firmware
- [Josef Adamčík](https://github.com/josefadamcik) for my first ever wireless split keyboard, the [Sofle](https://github.com/josefadamcik/SofleKeyboard)
- [Anarion](https://github.com/anarion80) for the [Porcupine](https://github.com/anarion80/porcupine) keyboard. This is basically what tought me to use Ergogen. This keyboard is also using his fork with added footprints.
