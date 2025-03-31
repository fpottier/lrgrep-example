.PHONY: all clean cov test promote

all:
	@ dune build src/main.exe

clean:
	@ git clean -fdX

# [make cov] tests whether errors.mlyl has complete coverage, that is,
# whether all syntax error situations are covered.

cov: all
	@ lrgrep -coverage-fatal src/errors.mlyl -g _build/default/src/parser.cmly

test:
	@ dune build @test

# [make promote] creates or updates the expected-output files test/{good,bad}/*.exp.

promote:
	@ dune promote

# [make conflicts] creates the files src/parser.{conflicts,automaton}.

.PHONY: conflicts
conflicts: all
	@ menhir --infer --explain --dump src/parser.mly && rm -f src/parser.{ml,mli}
