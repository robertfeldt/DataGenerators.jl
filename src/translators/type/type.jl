include("type_parse.jl")
include("type_transform.jl")
include("type_build.jl")

function type_rules(t::Type, rulenameprefix="")
	ast = parse_type(t)
	transform_type_ast(ast)
	transform_ast(ast) # this standard transform (which analysis reachability) isn't really needed for a type, but included for consistency with other translators
	build_type_rules(ast, rulenameprefix)
end

function type_generator(io::IO, genname::AbstractString, t::Type)
	rules = type_rules(t)
	description = "an instance of type $(t)"
	output_generator(io, genname, description, rules)
end