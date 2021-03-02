#!/usr/local/bin/julia
using ArgParse
using DelimitedFiles
using ProgressMeter

function main(args)
	configs = ArgParseSettings()
	
	add_arg_group!(configs, "I/O option:")
	@add_arg_table! configs begin
		"--MS"
			arg_type = String
			action	 = :store_arg
			help	 = "M x S descriptor matrix"
			required = true
		"--NS"
			arg_type = String
			action	 = :store_arg
			help	 = "N x S descriptor matrix"
			required = true
		"--MN", "-o"
			arg_type = String
			action	 = :store_arg
			help	 = "M x N similarity matrix"
			required = true
		"--delimiter", "-d"
			arg_type = Char
			action	 = :store_arg
			help	 = "Delimiter character between descriptor bits"
			required = false
			default  = ' '
	end

	args = parse_args(args, configs)

	delimiter = args["delimiter"]

	# Helper functions
	Tanimoto(x,y)   = sum(x .& y) / sum(x .| y)
	
    # Load matrices and get number of drugs, compounds, substructures and targets
	MS = readdlm(args["MS"], delimiter, Bool)
	NS = readdlm(args["NS"], delimiter, Bool)

	Nm, Ns1 = size(MS)
	Nn, Ns2 = size(NS)

	if Ns1 != Ns2
		println("[ERROR] Different size descriptors, can't calculate Tanimoto!")
		exit(1)
	end

	# Calculate Nm × Nn similarity matrix
	MN = zeros(Nm,Nn)
	@showprogress for (i, m) in enumerate(eachrow(MS))
		for (j, n) in enumerate(eachrow(NS))
			MN[i,j] = Tanimoto(m, n)
		end
	end

	writedlm(args["MN"], MN, delimiter)
end

main(ARGS)
