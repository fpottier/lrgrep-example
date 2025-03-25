.PHONY: all clean test coverage

all:
	@ dune build

clean:
	@ git clean -fdX

test:
	@ dune build @test

coverage: all
	@ lrgrep -coverage src/errors.mlyl -g _build/default/src/parser.cmly
