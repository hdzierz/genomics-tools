#!/bin/bash

# Try /usr/bin/TrimmomaticPE  and see if it is returns Usage.
# If it does, then output GFANZ_TEST_RESULTS=OK. If it does not, then output
# GFANZ_TEST_RESULTS=ERROR.
ls /usr/bin/TrimmomaticPE | grep TrimmomaticPE >> /dev/null

if [ $? -eq 0 ]; then
  echo "GFANZ_TEST_RESULTS=OK"
  exit 0
else
  echo "GFANZ_TEST_RESULTS=ERROR"
  exit 1
fi
