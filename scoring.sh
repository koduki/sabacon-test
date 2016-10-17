#!/bin/bash

cat /opt/gatling/results/*/simulation.log |grep 'login-success Redirect 1'|awk -F '\t' '$8=="OK" {print $0}'|wc -l
cat /opt/gatling/results/*/simulation.log |grep 'login-success Redirect 1'|awk -F '\t' '$8=="KO" {print $0}'|wc -l
