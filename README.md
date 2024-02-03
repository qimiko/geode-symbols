# Geode Symbols

What did you expect? 

The symbol server can currently be accessed at [symbols.xyze.dev](https://symbols.xyze.dev/). Recommended usage is to point a tool like [minidump-stackwalk](https://crates.io/crates/minidump-stackwalk) at it.

## Adding Symbols

1. Find the binary you want to dump the symbols of.

2. Use the dump_syms utility to dump the symbols.
  - [Mozilla's version](https://github.com/mozilla/dump_syms) is probably the easiest to setup
  - If you're using Mozilla's version, make sure to use the `--store` option to create the directory structure.

3. Upload symbols and create a pull request (or send to me).
