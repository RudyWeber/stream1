type token =
  | Dash
  | Plus
  | OpenPar
  | ClosePar
  | Num(int)

type t = string => list<token>

exception UnexpectedToken(char)

type lexState = {
  tokens: list<token>,
  neg: bool,
}

let lex = input =>
  List.init(String.length(input), String.get(input)) |> List.fold_left(({tokens, neg}, c) => {
    switch c {
    | '-' => {tokens: List.cons(Dash, tokens), neg: true}
    | '+' => {tokens: List.cons(Plus, tokens), neg: false}
    | '(' => {tokens: List.cons(OpenPar, tokens), neg: false}
    | ')' => {tokens: List.cons(ClosePar, tokens), neg: false}
    | ' ' => {tokens: tokens, neg: false}
    | c when c >= '0' && c <= '9' => {
        let n = Char.code(c) - 48
        switch tokens {
        | list{Dash, ...tokens} when neg => {tokens: List.cons(Num(n * -1), tokens), neg: false}
        | list{Num(n'), ...tokens} => {tokens: List.cons(Num(n' * 10 + n), tokens), neg: false}
        | _ => {tokens: List.cons(Num(n), tokens), neg: false}
        }
      }
    | c => raise(UnexpectedToken(c))
    }
  }, {tokens: list{}, neg: false}) |> (({tokens}) => List.rev(tokens))
