#!/bin/sh

for myTEST in test/*; do
  $myTEST
  printf "\n"
done
