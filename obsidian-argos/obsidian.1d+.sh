#!/usr/bin/env bash

ARGOS_DIR=$(dirname "$0")
OBSIDIAN_DIR=$HOME/obsidian

ICON=$(base64 -w 0 "${ARGOS_DIR}/data/obsidian-white.png")
echo "| image=$ICON imageWidth=16 imageHeight=16"
echo "---"

function get_projects() {
  grep -Rl --exclude-dir=.obsidian "#projects/${1}" $OBSIDIAN_DIR
}

RANDOM_FILE=$(get_projects 'active' | sort -R | head -n 1)
echo "daily note | href='obsidian://advanced-uri?commandid=daily-notes'"
echo "random active project | href='obsidian://$RANDOM_FILE'"
echo "---"

for TAG in 'priority' 'active' 'incubator'; do
  echo $TAG
  IFS=$'\n'
  for FILE in $(get_projects $TAG); do
    echo "--$(basename -s'.md' $FILE) | href='obsidian://$FILE'"
  done
  unset IFS
done
