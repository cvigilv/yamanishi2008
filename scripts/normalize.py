import pandas as pd
import argparse

# Parse commandline arguments
parser = argparse.ArgumentParser(description='Normalize descriptors')
parser.add_argument('-i', dest="input", required=True,
        help="C x D matrix file")
parser.add_argument('-o', dest="output", required=True,
        help="Normalized C x D matrix file")
parser.add_argument('--sep', dest="separator", required=False, default=" ",
        help="File separator/delimiter")
args = parser.parse_args()

# Load file and normalize
df            = pd.read_csv(args.input, sep=args.separator, header = None, index_col = None)
normalized_df = (df-df.min())/(df.max()-df.min())

# Write file
normalized_df.dropna(axis=1, inplace=True)
normalized_df.to_csv(args.output, sep = args.separator, header = None, index = None)
