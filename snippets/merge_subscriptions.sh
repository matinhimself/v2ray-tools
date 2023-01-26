#!/bin/bash

parent_dir="/root/servers"
output_dir="/root/merged"

for subfolder in "$parent_dir"/subscribe/*
do
    for file in "$subfolder"/*
    do
        filename=$(basename "$file")
        merged=$(base64 --decode "$file")
        for subfolder2 in "$parent_dir"/subscribe/*
        do
            file2="$subfolder2/$filename"
            if [ -f "$file2" ]; then
                decoded2=$(base64 --decode "$file2")
                merged="$merged$decoded2"
            fi
        done
        if [ -n "$merged" ]; then
            encoded=$(echo "$merged" | base64)
            echo "$encoded" > "$output_dir/$filename"
        fi
    done
done
