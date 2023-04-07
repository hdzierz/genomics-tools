#!/bin/bash

# See if ls /opt/SolexaQA++ returns Solexa.
# If it does, then output GFANZ_TEST_RESULTS=OK. If it does not, then output
# GFANZ_TEST_RESULTS=ERROR.
ls /opt/SolexaQA%2B%2B | grep Solexa >> /dev/null

if [ $? -eq 0 ]; then
  echo "GFANZ_TEST_RESULTS=OK"
  exit 0
else
  echo "GFANZ_TEST_RESULTS=ERROR"
  exit 1
fi
