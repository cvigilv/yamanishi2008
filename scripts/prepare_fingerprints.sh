#!/bin/sh

date

SMILES=$1

echo "Calculating fingerprints for $SMILES"
#~/Documents/uni/tesis/Results/NBI/2020-11-12-yamanishi2008-preparation/scripts/prepare_fp2.sh $SMILES
#~/Documents/uni/tesis/Results/NBI/2020-11-12-yamanishi2008-preparation/scripts/prepare_fp3.sh $SMILES
#~/Documents/uni/tesis/Results/NBI/2020-11-12-yamanishi2008-preparation/scripts/prepare_fp4.sh $SMILES
#~/Documents/uni/tesis/Results/NBI/2020-11-12-yamanishi2008-preparation/scripts/prepare_maccs.sh $SMILES
~/thesis/datasets/yamanishi2008/scripts/prepare_ecfp0.sh $SMILES
~/thesis/datasets/yamanishi2008/scripts/prepare_ecfp2.sh $SMILES
~/thesis/datasets/yamanishi2008/scripts/prepare_ecfp4.sh $SMILES
~/thesis/datasets/yamanishi2008/scripts/prepare_ecfp6.sh $SMILES
~/thesis/datasets/yamanishi2008/scripts/prepare_ecfp8.sh $SMILES
~/thesis/datasets/yamanishi2008/scripts/prepare_ecfp10.sh $SMILES
echo "DONE!"

date
