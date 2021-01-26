type token =
  | Dash
  | Plus
  | OpenPar
  | ClosePar
  | Num(int)

type t = string => list<token>

exception UnexpectedToken(char)

let lex = input => List.init(String.length(input), String.get(input))
 |> List.fold_left((tokens, c) => {
  switch c {
    | '-' => List.cons(Dash, tokens)
    | '+' => List.cons(Plus, tokens)
    | '(' => List.cons(OpenPar, tokens)
    | ')' => List.cons(ClosePar, tokens)
    | ' ' => tokens
    | c when c >= '0' && c <= '9' => {
      let n = Char.code(c) - 48
      switch tokens {
        | list{Dash, ...tokens} => List.cons(Num(n * (-1)), tokens)
        | list{Num(n'), ...tokens} => List.cons(Num(n' * 10 + n), tokens)
        | _ => List.cons(Num(n), tokens)
      }
    }
    | c => raise(UnexpectedToken(c))
  }
 }, list{}) |> List.rev
