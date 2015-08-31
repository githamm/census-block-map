#!/bin/bash
# Clean the geo files.
# Remove every thing but the PCT. Eventually will want to make the part
# we're parsing out configurable. Right now it parses out two chunks in each 
# string, ala blah blah DELETE DELETE blah blah DELETE DELETE blah.
#
# Outputs to STDOUT

FILE='denver.census.blocks.short.geo.js'
while [ "$1" != "" ]; do
    case $1 in
        -f | --file ) shift
            FILE=$1
            ;;
        -t | --test ) shift
            TEST=1
            ;;
    esac
    shift
done

gsed 's/"HISPANIC_2.*"PCT_HISPAN/"PCT_HISPAN/p' "$FILE" | gsed 's/"HOUSINGUNI.*"RENTED_A_8":[0-9]*,//p'
