// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Jest = require("@glennsl/bs-jest/src/jest.bs.js");
var Lexer = require("../src/Lexer.bs.js");
var Parser = require("../src/Parser.bs.js");

Jest.describe("Parser", (function (param) {
        return Jest.test("it should parse", (function (param) {
                      return Jest.Expect.toEqual({
                                  TAG: /* Sub */2,
                                  _0: {
                                    TAG: /* Sub */2,
                                    _0: {
                                      TAG: /* Val */0,
                                      _0: -1
                                    },
                                    _1: {
                                      TAG: /* Add */1,
                                      _0: {
                                        TAG: /* Val */0,
                                        _0: 2
                                      },
                                      _1: {
                                        TAG: /* Val */0,
                                        _0: 3
                                      }
                                    }
                                  },
                                  _1: {
                                    TAG: /* Val */0,
                                    _0: 4
                                  }
                                }, Jest.Expect.expect(Parser.parse(Lexer.lex("-1 - (2 + 3) - 4"))));
                    }));
      }));

/*  Not a pure module */
