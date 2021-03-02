#!/bin/bash

date

DS="../DS"
DD="../DD"

for NETWORK in e ic gpcr; # nr; 
do
	#for FINGERPRINT in fp2 fp3 fp4 maccs;
	for FINGERPRINT in ecfp0 ecfp2 ecfp4 ecfp6 ecfp8 ecfp10;
	do
        DS_FILE="${DS}/${NETWORK}_DS.${FINGERPRINT}.txt"
        DD_FILE="${DD}/${NETWORK}_DD.${FINGERPRINT}.txt"

		julia Tanimoto_MxN.jl --MS $DS_FILE --NS $DS_FILE --MN $DD_FILE
	done
done

echo "DONE!"

date
