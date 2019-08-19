#!/bin/bash

# Try GBS-SNP-CROP-1.pl and see if it returns GBS-SNP-CROP
# If it does, then output GFANZ_TEST_RESULTS=OK. If it does not, then output
# GFANZ_TEST_RESULTS=ERROR.
/opt/helloworld.sh | grep Hello >> /dev/null

/opt/GBS-SNP-CROP/GBS-SNP-CROP-scripts/v.4.0/GBS-SNP-CROP-1.pl  2>&1 | grep GBS-SNP-CROP >> /dev/null

if [ $? -eq 0 ]; then
  echo "GFANZ_TEST_RESULTS=OK"
  exit 0
else
  echo "GFANZ_TEST_RESULTS=ERROR"
  exit 1
fi
