#!/bin/bash
RESULT_DIR=$1

cat ${RESULT_DIR}/simulation.log |grep 'login-success Redirect 1'|awk -F '\t' '$8=="OK" {print $0}'|wc -l
#cat ${RESULT_DIR}/simulation.log |grep 'login-success Redirect 1'|awk -F '\t' '$8=="KO" {print $0}'|wc -l