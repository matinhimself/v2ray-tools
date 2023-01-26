#!/bin/bash


# mc is minio client
mc config host add arvan http:s3host "<API-KEY>" "<SECRET-KEY>" --api S3v4
mc cp --attr Content-Type=text/plain --recursive --overwrite /tmp/subscribe/ arvan/"$bucket"/subs/"$server"/subscribes/


