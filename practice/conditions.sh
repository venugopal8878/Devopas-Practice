#!bin/bash

number=$1

if [ $number -gt 20 ] #gt-greater than eq-equla -nq not qual
then
   echo "given number $number greater than 20"
else
    echo "not equal to $number 20"
fi