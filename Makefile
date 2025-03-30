.PHONY: all clean coverage test promote

all:
	@ dune build

clean:
	@ git clean -fdX

# [make coverage] tests whether errors.mlyl has complete coverage, that is,
# whether all syntax error situations are covered.

coverage: all
	@ lrgrep -coverage src/errors.mlyl -g _build/default/src/parser.cmly

test:
	@ dune build @test

# [make promote] creates or updates the expected-output files test/{good,bad}/*.exp.

promote: test
	@ dune promote

# [make conflicts] creates the files src/parser.{conflicts,automaton}.

.PHONY: conflicts
conflicts: all
	@ menhir --infer --explain --dump src/parser.mly && rm -f src/parser.{ml,mli}
