.PHONY: all clean cov test promote

all:
	@ dune build src/main.exe

clean:
	@ git clean -fdX

# [make cov] tests whether errors.mlyl has complete coverage, that is,
# whether all syntax error situations are covered.

cov: all
	@ lrgrep -coverage-fatal -s src/errors.mlyl -g _build/default/src/parser.cmly

test:
	@ dune build @test

# [make promote] creates or updates the expected-output files test/{good,bad}/*.exp.

promote:
	@ dune promote

# [make data] creates the files src/parser.{conflicts,automaton,pdf}.

.PHONY: data
data: all
	@ menhir --infer --explain --dump --automaton-graph src/parser.mly
	@ rm -f src/parser.{ml,mli}
	@ dot -Tpdf src/parser.dot > src/parser.pdf
	@ rm -f src/parser.dot
