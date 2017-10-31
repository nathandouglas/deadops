TAG=${2-'latest'}

nvidia-docker run \
    -e "BL_ES_INDEX=" \
    -e "BL_ES_TYPE=" \
    -e "BL_CALLBACK_URI=" \
    -e "BL_LOGFILE=" \
    -e "BL_RECORD_ID=" \
    -e "BL_INPATH=" \
    -v /mnt/docker_images/phones:/data:ro \
    -v /logs:/logs \
    -v /blworkdir:/srv \
    --rm \
    --net=host \
    -it \
    bluelake/bl-data-ingest:local bash
