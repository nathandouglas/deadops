#!/bin/bash

OUTPUT_DIR=${2-$(pwd)}

echo "Reading images.txt..."
echo "Saving compressed images to $OUTPUT_DIR/"

while IFS='' read -r line || [[ -n "$line" ]]; do
    ARCH_FILE=$line.tar.xz

    echo "Checking if $OUTPUT_DIR/$ARCH_FILE exists"

    if [[ ! -f $ARCH_FILE ]]
    then
        # -- NOTE: Always pull latest... better safe than sorry I suppose
        #
        # echo "$ARCH_FILE not found, checking for local image: $line"

        # if [[ $(docker images -q "$line") == "" ]]; then
        #     # If image was not found locally pull it
        #     echo "$line not found locally, pulling image: $line"
        #     docker pull "$line"
        # fi

        docker pull "$line"

        echo "Saving compressed image $line..."
        # Call `docker save` and pipe the resulting tar output to gzip for maximum compression
        # The sed command is stripping off the repository name for example:
        # bluelake/bl-data-ingest:1.0 -> bl-data-ingest:1.0
        # this is because when saving the tar, a directory bluelake/
        docker save $line | xz -1v > "$OUTPUT_DIR/$(echo "$ARCH_FILE" | sed s:^.*/::)"
        echo "Archive created: $OUTPUT_DIR/$ARCH_FILE"
    else
        echo "Skipping $ARCH_FILE, archive already exists: $OUTPUT_DIR/$ARCH_FILE"
    fi

done < "$1"

echo "Finished compressing docker images..."
