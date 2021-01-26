let input = "-1 - (2 - 3) + 4"

let run =
  input
  |> Lexer.lex
  |> Parser.parse
  |> Compiler.compile

run() |> Js.log

