# Geode Symbols

The symbol server for Geode Android binaries can currently be accessed at [symbols.xyze.dev](https://symbols.xyze.dev/).

The recommended usage is to point a tool like [minidump-stackwalk](https://crates.io/crates/minidump-stackwalk) at it. However, cloning the repository locally works as well. Just make sure to create a shallow clone!

## Adding Other Symbols

1. Find the binary you want to dump the symbols of.

2. Use the dump_syms utility to dump the symbols.
  - [Mozilla's version](https://github.com/mozilla/dump_syms) is probably the easiest to setup
  - If you're using Mozilla's version, make sure to use the `--store` option to create the directory structure.

3. Upload symbols and create a pull request (or send to me).

## Licensing

The symbols contained in this repository are intended to be used by mod developers and users for the purposes of debugging crashes. No promises are made as to the accuracy of the symbols or the safety of their contents. If you have an issue with the symbols of your binaries appearing in the repository, please contact me.
