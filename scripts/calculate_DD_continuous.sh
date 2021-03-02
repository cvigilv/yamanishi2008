#!/bin/bash

date

DS="../DS"
DD="../DD"

for NETWORK in e ic gpcr nr; 
do
	for FINGERPRINT in mold2 spectrophores;
	do
		echo "$NETWORK - $FINGERPRINT"

        DS_FILE="${DS}/${NETWORK}_DS.${FINGERPRINT}.txt"
        DD_FILE="${DD}/${NETWORK}_DD.${FINGERPRINT}.txt"

		python3 normalize.py  -i $DS_FILE		-o /tmp/DS.norm
		python3 similarity.py -i /tmp/DS.norm -o  $DD_FILE

		rm /tmp/DS.norm
	done
done

echo "DONE!"

date
