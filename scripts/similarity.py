import argparse
import numpy as np
import pandas as pd
from scipy.spatial.distance import cdist

# Parse commandline arguments
parser = argparse.ArgumentParser(description='Normalize descriptors')
parser.add_argument('-i', dest="input", required=True,
        help="C x D matrix file")
parser.add_argument('-o', dest="output", required=True,
        help="C x C similarity matrix file")
parser.add_argument('--sep', dest="separator", required=False, default=" ",
        help="File separator/delimiter")
args = parser.parse_args()

# Load file and calculate simiarity measure
df   = pd.read_csv(args.input, sep=args.separator, header = None, index_col = None)
dist = cdist(df, df, "euclidean")

# Normalize
min_dist = dist.min()
max_dist = dist.max()
minmax = lambda value: (value-min_dist)/(max_dist-min_dist)
v_minmax = np.vectorize(minmax)

sim = 1 - v_minmax(dist)

# Write output
np.savetxt(args.output, sim, delimiter = args.separator)
