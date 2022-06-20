#!/bin/bash

# Try ipyrad  and see if it is returns ipyrad.
# If it does, then output GFANZ_TEST_RESULTS=OK. If it does not, then output
# GFANZ_TEST_RESULTS=ERROR.
/opt/conda/bin/ipyrad -h | grep ipyrad >> /dev/null

if [ $? -eq 0 ]; then
  echo "GFANZ_TEST_RESULTS=OK"
  exit 0
else
  echo "GFANZ_TEST_RESULTS=ERROR"
  exit 1
fi
