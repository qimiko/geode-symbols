#!/bin/bash

# Adds symbol files from the latest Geode releases.
# Requires jq + unzip to be installed.

supported_platforms=( "android32" "android64" )
release_url="https://api.github.com/repos/geode-sdk/geode/releases/latest"

# validate a user has jq and unzip installed
if ! [[ -x "$(command -v jq)" ]]
then
  echo "error: jq unavailable"
  exit 1
fi

if ! [[ -x "$(command -v unzip)" ]]
then
  echo "error: unzip unavailable"
  exit 1
fi

tempdir=$TMPDIR
releases=$(curl -s "$release_url")

for platform in "${supported_platforms[@]}"
do
  echo "Processing platform $platform"

  download_path="$tempdir/release.zip"
  platform_download="$platform.zip"

  download_url=$(echo $releases | jq -r --arg platform "$platform_download" '.assets[] | select(.name | contains($platform)) | .browser_download_url')
  if [[ -z "$download_url" ]]
  then
    echo "Skipping platform $platform, no download found"
    continue
  fi

  curl $download_url --clobber -Lo $download_path

  release_dir="$tempdir/release"
  unzip -q $download_path -d $release_dir

  # the option messes up jq for some reason, so set it here and then unset
  shopt -s nullglob
  for sym in $release_dir/*.sym
  do
    ./copy_syms.sh $sym
  done
  shopt -u nullglob

  rm -rf $download_path $release_dir
done
