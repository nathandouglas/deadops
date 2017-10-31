# Test script to initiate ingest
#!/usr/bin/env bash

RECORD_ID=$1
STATUS=$2

curl -XPATCH "bl-ingest.net/api/ingest/$RECORD_ID" -H "Content-Type: application/json" -d "{\"statusCode\": $STATUS}"
