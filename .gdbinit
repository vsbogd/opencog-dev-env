#
# Guile garbage collection uses these, ignore them.
#
handle SIGPWR noprint nostop
handle SIGXCPU noprint nostop

set print elements 4096

# This allows to use on poc on all opencog objects.
set overload-resolution on

#
# Print opencog objects. To be printabled the object must overload the
# function oc_to_string in the opencog namespace (it must use
# namespace opencog { ... }, using namespace opencog won't do)..
#
 
define poc
	if $argc == 0
		help patom
	else
		whatis $arg0
		printf "%s\n", opencog::oc_to_string($arg0, opencog::empty_string)._M_dataplus._M_p
	end
end

document poc
	Prints opencog object information.
	Syntax: poc <opencog object>
	Example:
	poc h - Prints the hypergraph corresponding to h
end

#
# Print opencog::AtomSpace
#

define patomspace
	if $argc == 0
		help patomspace
	else
		printf "%s", $arg0.to_string()._M_dataplus._M_p
	end
end

document patomspace
	Prints opencog::AtomSpace information.
	Syntax: patomspace <atomspace>
	Example:
	patomspace as - Prints the whole atomspace as
end
