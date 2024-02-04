#!/bin/bash

# Script to copy symbols from a given symbol file into the expected directory structure.
# This script does not perform path validation, please don't run this with untrusted input.
# dump_syms usually does this for you.

if [[ $# -ne 1 ]]
then
  echo "Usage: $0 <symbol file>"
  exit 2
fi

path=$1

module_info=$(head -n 1 $path)

read -r module _ _ id name <<< $module_info

if [[ "$module" != "MODULE" ]]
then
  echo "provided file is not a symbol file"
  exit 2
fi

sym_dir="$name/$id"

mkdir -p $sym_dir

output_filename="$name.sym"
output_path="$sym_dir/$output_filename"

cp $path ./$output_path

echo "Saved symbols to ./$output_path"
