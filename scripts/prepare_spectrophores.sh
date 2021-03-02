#!/bin/sh

SMILES=$1
SPECTROPHORES=$(echo $SMILES | sed -- 's/\.smi/S.spectrophores.txt/g' | sed -- 's/SMILES/DS/g')

obspectrophore -i $SMILES | tail -n +12 | cut -d"	" -f2- > $SPECTROPHORES
