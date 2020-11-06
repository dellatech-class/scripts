#!/bin/bash
#Demo Read
echo "Please Enter Your First Name: "
read FIRST
echo "Please Enter Your Last Name: "
read LAST

echo "Hello $FIRST $LAST, welcome to www.dellatechglobal.com"

echo "Enter your Age: "
read AGE

echo "In 20 years you will be `expr $AGE + 20` years old"
