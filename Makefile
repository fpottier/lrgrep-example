.PHONY: all clean test coverage

all:
	@ dune build

clean:
	@ git clean -fdX

# To create or update the expected-output files test/{good,bad}/*.exp,
# use [dune promote].

test:
	@ dune build @test

coverage: all
	@ lrgrep -coverage src/errors.mlyl -g _build/default/src/parser.cmly
