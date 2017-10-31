# Test script to initiate ingest
#!/usr/bin/env bash

EVIDENCE_DIR=$1

curl -XPOST "bl-ingest.net/api/ingest" -H "Content-Type: application/json" -d '{"directory":"$EVIDENCE_DIR"}'

