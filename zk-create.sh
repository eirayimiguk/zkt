#!/bin/bash

CURRENT_DATE=$(date +"%Y-%m-%d %H:%M:%S")
UNIQUE_ID=$(echo $CURRENT_DATE | sed 's/-//g' | sed 's/ //g' | sed 's/://g')

ZK_HOME="$HOME/zettelkasten"
MD_FILE="$ZK_HOME/$UNIQUE_ID.md"

echo "Create: $MD_FILE"

cat note.tpl \
    | sed "s/\${uid}/${UNIQUE_ID}/g" \
    | sed "s/\${created_at}/${CURRENT_DATE}/g" \
    | sed "s/\${updated_at}/${CURRENT_DATE}/g" \
    > $MD_FILE

nvim $MD_FILE

