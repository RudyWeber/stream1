open AST
open Lexer

exception ParserError

let parse = tokens => {
  let operandStack = Stack.create()
  let operatorStack = Stack.create()

  let buildAstNode = () => {
    let b = Stack.pop(operandStack)
    let a = Stack.pop(operandStack)
    switch Stack.pop(operatorStack) {
    | Plus => Stack.push(Add(a, b), operandStack)
    | Dash => Stack.push(Sub(a, b), operandStack)
    | _ => raise(ParserError)
    }
  }

  List.iter(token => {
    switch token {
    | Num(n) => Stack.push(Val(n), operandStack)
    | OpenPar => Stack.push(OpenPar, operatorStack)
    | Plus
    | Dash => {
        while !Stack.is_empty(operatorStack) && Stack.top(operatorStack) != OpenPar {
          buildAstNode()
        }

        Stack.push(token, operatorStack)
      }
    | ClosePar => {
        while Stack.top(operatorStack) != OpenPar {
          buildAstNode()
        }

        let _ = Stack.pop(operatorStack)
      }
    }
  }, tokens)

  while !Stack.is_empty(operatorStack) {
    buildAstNode()
  }

  Stack.pop(operandStack)
}
