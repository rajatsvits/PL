{
exception Lexer_exception of string
}

let digit = ['0'-'9']
let integer = ['0'-'9']['0'-'9']*
let id = ['a'-'z''A'-'Z'] ['a'-'z' 'A'-'Z' '0'-'9']*

rule scan = parse
  | [' ' '\t' '\n']+  { scan lexbuf                         }
  | '('          { Parser.LPAREN                     }
  | ')'          { Parser.RPAREN                     }
  | ':'          { Parser.COLON                      }
  | '-'          { Parser.SUBTRACT                   }
  | '+'          { Parser.ADD                        }
  | integer as s { Parser.INTEGER((int_of_string s)) }
  | id as s      { Parser.ID(s)                      }
  | ','          { Parser.COMMA                      }
  | eof          { Parser.EOF                        }

{
}
