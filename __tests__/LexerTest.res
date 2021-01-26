open Jest
open Expect

open Lexer

describe("Lexer", () => {
  test("it should lex", () => {
    let input = "-1 + (20 + 3)"

    expect(Lexer.lex(input)) |> toEqual(list{
      Num(-1),
      Plus,
      OpenPar,
      Num(20),
      Plus,
      Num(3),
      ClosePar
    })
  })
})
