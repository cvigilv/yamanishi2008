using DelimitedFiles
using ArgParse

function main(args)
	configs = ArgParseSettings()
	
	add_arg_group!(configs, "I/O options:")
	@add_arg_table! configs begin
		"-i" "--input"
			arg_type = String
			action	 = :store_arg
			help	 = "Matrix file path"
			required = true
		"-o" "--output"
			arg_type = String
			action	 = :store_arg
			help	 = "Transposed matrix file path"
			required = true
		"--sep"
			arg_type = Char
			action	 = :store_arg
			help	 = "Separator between values of matrix"
			default	 = '\t'
			required = false
	end

	parsed_args = parse_args(args, configs)

	A = readdlm(parsed_args["input"], parsed_args["sep"], Int64, '\n')
	open(parsed_args["output"], "w") do outmat
		writedlm(outmat, A')
	end
end

main(ARGS)
