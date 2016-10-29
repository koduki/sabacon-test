#!/bin/bash

SIMULATION=$1

/opt/gatling/bin/gatling.sh -s $SIMULATION -rf /opt/gatling/results/

RESULT_DIR=`find /opt/gatling/results/ -type d|head -2|tail -1`
echo $RESULT_DIR
/script/scoring.sh ${RESULT_DIR} > ${RESULT_DIR}/score.txt

echo
echo "==========="
echo "Score"
echo "==========="
cat ${RESULT_DIR}/score.txt
