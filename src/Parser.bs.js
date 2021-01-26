// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var List = require("bs-platform/lib/js/list.js");
var Stack = require("bs-platform/lib/js/stack.js");
var Caml_exceptions = require("bs-platform/lib/js/caml_exceptions.js");

var ParserError = Caml_exceptions.create("Parser.ParserError");

function parse(tokens) {
  var operandStack = Stack.create(undefined);
  var operatorStack = Stack.create(undefined);
  var buildAstNode = function (param) {
    var b = Stack.pop(operandStack);
    var a = Stack.pop(operandStack);
    var match = Stack.pop(operatorStack);
    if (typeof match === "number") {
      if (match === 1) {
        return Stack.push({
                    TAG: /* Add */1,
                    _0: a,
                    _1: b
                  }, operandStack);
      }
      if (match !== 0) {
        throw {
              RE_EXN_ID: ParserError,
              Error: new Error()
            };
      }
      return Stack.push({
                  TAG: /* Sub */2,
                  _0: a,
                  _1: b
                }, operandStack);
    }
    throw {
          RE_EXN_ID: ParserError,
          Error: new Error()
        };
  };
  List.iter((function (token) {
          if (typeof token !== "number") {
            return Stack.push({
                        TAG: /* Val */0,
                        _0: token._0
                      }, operandStack);
          }
          if (token === 2) {
            return Stack.push(/* OpenPar */2, operatorStack);
          }
          if (token >= 3) {
            while(Stack.top(operatorStack) !== /* OpenPar */2) {
              buildAstNode(undefined);
            };
            Stack.pop(operatorStack);
            return ;
          }
          while(!Stack.is_empty(operatorStack) && Stack.top(operatorStack) !== /* OpenPar */2) {
            buildAstNode(undefined);
          };
          return Stack.push(token, operatorStack);
        }), tokens);
  while(!Stack.is_empty(operatorStack)) {
    buildAstNode(undefined);
  };
  return Stack.pop(operandStack);
}

exports.ParserError = ParserError;
exports.parse = parse;
/* No side effect */
