type rec expression =
  | Val(int)
  | Add(expression, expression)
  | Sub(expression, expression)
