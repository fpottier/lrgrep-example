{
  open Parser
  exception Error of Lexing.position * string
}

rule token = parse
| [' ' '\t']
    { token lexbuf }
| ['\n']
    { Lexing.new_line lexbuf; token lexbuf }
| eof
    { EOF }
| ['0'-'9']+ as i
    { INT (int_of_string i) }
| '+'
    { PLUS }
| '-'
    { MINUS }
| '*'
    { TIMES }
| '/'
    { DIV }
| '('
    { LPAREN }
| ')'
    { RPAREN }
| _ as c
    { let position = Lexing.lexeme_start_p lexbuf in
      let message = Printf.sprintf "Unexpected character: '%c'" c in
      raise (Error (position, message)) }
