# Geode Symbols

This repository contains symbol files for stable Geode Android releases, latest Geometry Dash releases and some popular Geode mods.

The symbol server can currently be accessed at [symbols.xyze.dev](https://symbols.xyze.dev/). The recommended usage is to point a tool like [minidump-stackwalk](https://crates.io/crates/minidump-stackwalk) at it. However, cloning the repository locally works as well. Just make sure to create a shallow clone!

## Adding Geode Symbols

To update the Geode symbols with the latest release, just run `./update_geode_syms.sh`. This script will download the latest release and add it to the symbol database.

A GitHub Actions workflow will be provided at some point to make this process even more automatic.

## Adding Other Symbols

1. Find the binary you want to dump the symbols of.

2. Use the Breakpad `dump_syms` utility to dump the symbols of the binary.
  - [Mozilla's version](https://github.com/mozilla/dump_syms) is probably the easiest to setup
  - If you're using Mozilla's version, make sure to use the `--store` option to create the directory structure.

3. Upload symbols and create a pull request (or send to me).

## Licensing

The symbols contained in this repository are intended to be used by mod developers and users for the purposes of debugging crashes. No promises are made as to the accuracy of the symbols or the safety of their contents. If you have an issue with the symbols of your binaries appearing in the repository, please contact me.
