#!/bin/bash

OUTPUT_DIR=${2-$(pwd)}

echo "Reading images.txt..."
echo "Pulling images..."

while IFS='' read -r line || [[ -n "$line" ]]; do
    docker pull "$line"
done < "$1"

echo "Finished pulling docker images..."
