In this demo, the parser is compiled with the flags `--table` and
`--inspection`. The first flag causes the parser to run in a relatively slower,
interpreted mode. The second flag allows the parser's stack to be inspected at
runtime. Both flags must be passed when one wishes to work with `lrgrep`.

If desired, one can compile a copy of the parser without these flags. Thus, one
obtains a parser that runs in faster, compiled mode, which does not allow the
stack to be inspected. One runs this fast parser first; if it fails, then one
starts over and runs the slower parser on the same input, so as to produce a
good syntax error message. This demo does not illustrate this two-phase process.
