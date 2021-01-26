open Jest
open Expect

open Lexer
open Parser
open AST

describe("Parser", () => {
  test("it should parse", () => {
    let input = "-1 + (20 + 3)"

    expect(lex(input) |> parse)|> toEqual(
      Add(Val(-1), (Add(Val(20), Val(3))))
    )
  })
})
