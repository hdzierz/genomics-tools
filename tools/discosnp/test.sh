#!/bin/bash

# Try run_discoSnp++.sh and see if it returns helloworld.sh.
# If it does, then output GFANZ_TEST_RESULTS=OK. If it does not, then output
# GFANZ_TEST_RESULTS=ERROR.

/opt/conda/bin/run_discoSnp++.sh | grep Version >> /dev/null

if [ $? -eq 0 ]; then
  echo "GFANZ_TEST_RESULTS=OK"
  exit 0
else
  echo "GFANZ_TEST_RESULTS=ERROR"
  exit 1
fi
