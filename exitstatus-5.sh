#!/bin/bash
# Demo Exit Status
set -e # exits as soon as there an error
expr 1 + 5
echo $?

rm doesnotexist
echo $?

expr 10 + 10
echo $?
