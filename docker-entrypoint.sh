#!/bin/bash

SIMULATION=$1

/opt/gatling/bin/gatling.sh -s $SIMULATION

RESULT_DIR=`ls -d /opt/gatling/results/`
/script/scoring.sh > ${RESULT_DIR}/score.txt

echo
echo "==========="
echo "Score"
echo "==========="
cat ${RESULT_DIR}/score.txt
