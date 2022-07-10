#!/bin/bash

# Try batch_trim.pl  and see if it is returns batch_trim.pl.
# If it does, then output GFANZ_TEST_RESULTS=OK. If it does not, then output
# GFANZ_TEST_RESULTS=ERROR.
cat /opt/gbs-preprocess/batch_trim.pl | grep batch_trim.pl >> /dev/null

if [ $? -eq 0 ]; then
  echo "GFANZ_TEST_RESULTS=OK"
  exit 0
else
  echo "GFANZ_TEST_RESULTS=ERROR"
  exit 1
fi
