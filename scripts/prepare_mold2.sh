#!/bin/sh

SDF=$1
MOLD2=$(echo $SDF | sed -- 's/\.sdf/S.mold2.txt/g' | sed -- 's/SDF/DS/g')

Mold2 -i $SDF -o /tmp/tmp.mold2		# Calculate descriptors
cat /tmp/tmp.mold2 | tail -n+2 | cut -d"	" -f2- > $MOLD2	# Cleanup descriptor file
sed -i "s/\t/\ /g" $MOLD2 # Replace tabs for spaces

rm report.txt
rm /tmp/*.mold2
