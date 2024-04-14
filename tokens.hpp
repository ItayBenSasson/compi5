#ifndef TOKENS_HPP_
#define TOKENS_HPP_

//need incluide for size_t
#include <cstddef>
#include <string>

//override string with char*
typedef char* string;

  enum tokentype
  {
    VOID = 1,
    INT = 2,
    BYTE = 3,
    B = 4,
    BOOL = 5,
    AND = 6,
    OR = 7,
    NOT = 8,
    TRUE = 9,
    FALSE = 10,
    RETURN = 11,
    IF = 12,
    ELSE = 13,
    WHILE = 14,
    BREAK = 15,
    CONTINUE = 16, 
    SC = 17,
    LPAREN = 18,
    RPAREN = 19,
    LBRACE = 20,
    RBRACE = 21,
    ASSIGN = 22,
    RELOP = 23,
    BINOP = 24,
    COMMENT = 25,
    ID = 26,
    NUM = 27,
    STRING = 28,
    ERROR_CHAR = 29,
    ERROR_UNCLOSED_STRING = 30,
    ERROR_UNDEFINED_ESCAPE_SEQ = 31
  };
  extern int yylineno;
  extern char* yytext;
  extern int yyleng;
  extern int yylex();
  //extern char string_to_print[1025];


#endif /* TOKENS_HPP_ */