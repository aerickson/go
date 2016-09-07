#!/usr/bin/env bash

set -e

image_name="$1"
image_id=`docker ps -f ancestor=${image_name} | grep ${image_name} | cut -f 1 -d ' '`
url=`docker port ${image_id} 9292`
open http://$url
