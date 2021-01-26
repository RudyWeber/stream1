open AST

type t = expression => unit => int

let rec compile = expression => {
  switch expression {
    | Val(n) => () => n
    | Add(left, right) => () => compile(left)() + compile(right)()
    | Sub(left, right) => () => compile(left)() - compile(right)()
  }
}
