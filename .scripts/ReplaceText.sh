#!/usr/bin/bash

DIRECTORY="$1"
OLD_TEXT="$2"
NEW_TEXT="$3"

find "$DIRECTORY" -type f | while read -r file; do
  if [[ "$file" != *"/.git/"* && "$file" != *"/.git/"*/* && \
      "$file" != *"/.scripts/"* && "$file" != *"/.scripts/"*/* && \
      "$file" != *"/extern/"* && "$file" != *"/extern/"*/* ]]; then
    sed -i "s|$OLD_TEXT|$NEW_TEXT|g" "$file"
    echo "Text replaced in: $file"
  fi
done

echo "Replacement completed!"