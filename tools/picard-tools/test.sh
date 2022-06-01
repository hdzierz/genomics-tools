#!/bin/bash

# Try picard-tools FilterVcf  and see if it is returns 'JavOpt' .
# If it does, then output GFANZ_TEST_RESULTS=OK. If it does not, then output
# GFANZ_TEST_RESULTS=ERROR.
/usr/bin/PicardCommandLine FilterVcf | grep 'JavOpt' >> /dev/null

if [ $? -eq 0 ]; then
  echo "GFANZ_TEST_RESULTS=OK"
  exit 0
else
  echo "GFANZ_TEST_RESULTS=ERROR"
  exit 1
fi
