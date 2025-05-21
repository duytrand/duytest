#!/bin/bash

MAX_RETRIES=3
RETRY_DELAY=10

for i in $(seq 1 $MAX_RETRIES); do
    echo "Attempt $i of $MAX_RETRIES"
    if docker push ghcr.io/proplytics/rent-estimator-app-test; then
        echo "Push successful!"
        exit 0
    else
        echo "Push failed. Waiting $RETRY_DELAY seconds before retry..."
        sleep $RETRY_DELAY
    fi
done

echo "Failed to push after $MAX_RETRIES attempts"
exit 1 