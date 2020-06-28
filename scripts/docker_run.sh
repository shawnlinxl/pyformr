#!/bin/bash
docker run -p 8787:8787 -e DISABLE_AUTH=true -e ROOT=TRUE --rm -v $(pwd):/pyformr -d pyformr