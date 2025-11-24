#!/usr/bin/env bash


array=(a b c d)

for index ${!array[@]}
do
    echo $index
done