#! /bin/bash


if [ -f myBase.csv ]
then
    userNumber=`cat myBase.csv  | wc -l`
    echo "The current users number is  : $userNumber"
else
    echo "The current users number is  : 0 "
fi

if [ -f state.txt ]
then
    visitesNumber=`cat state.txt  | wc -l`
    echo "The current visites number is  : $visitesNumber"
else
    echo "The current visites number is  : 0 "
fi