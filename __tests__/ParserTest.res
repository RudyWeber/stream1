open Jest
open Expect

open Lexer
open Parser
open AST

describe("Parser", () => {
  test("it should parse", () => {
    let input = "-1 - (2 + 3) - 4"

    expect(lex(input) |> parse)|> toEqual(
      Sub(Sub(Val(-1), Add(Val(2), Val(3))), Val(4))
    )
  })
})
