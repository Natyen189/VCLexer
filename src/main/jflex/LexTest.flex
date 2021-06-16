/* JFlex example: partial Java language lexer specification */
import java_cup.runtime.*;
import main.Token;
import main.sym;

/**
 * This class is a simple example lexer.
 */
%%

%class Lexer
%unicode
%cup
%line
%column
%public
%type Token
%{
  private Token symbol(int type) {
    return new Token(type);
  }
  private Token symbol(int type, Object value) {
    return new Token(type, value);
  }
%}

%eof{
    System.exit(0);
%eof}

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment}

TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
// Comment can be the last line of the file, without line terminator.
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
CommentContent       = ( [^*] | \*+ [^/*] )*

/* identifiers */
Identifier = [:jletter:] ([:jletter:] | [:jletterdigit:])*

/* separator */
Separator = "{" | "}" | "(" | ")" | "[" | "]" | ";" | "," | "."

/* literal */
DecIntegerLiteral = 0 | [1-9][0-9]*
FloatLiteral  = ({FLit1}|{FLit2}|{FLit3}) {Exponent}?

FLit1    = [0-9]+ \. [0-9]*
FLit2    = \. [0-9]+
FLit3    = [0-9]+
Exponent = [eE] [+-]? [0-9]+

BooleanLiteral = "true" | "false"
StringLiteral = \"[^\"]*\"

/* array */
ArrayKeyword = "boolean" | "float" | "int"
Array = {ArrayKeyword}"[]"

%%


/* keywords */
<YYINITIAL> "boolean"           { return symbol(sym.BOOLEAN, yytext()); }
<YYINITIAL> "break"            { return symbol(sym.BREAK, yytext()); }
<YYINITIAL> "continue"              { return symbol(sym.CONTINUE, yytext()); }
<YYINITIAL> "else"           { return symbol(sym.ELSE, yytext()); }
<YYINITIAL> "for"            { return symbol(sym.FOR, yytext()); }
<YYINITIAL> "float"              { return symbol(sym.FLOAT, yytext()); }
<YYINITIAL> "if"           { return symbol(sym.IF, yytext()); }
<YYINITIAL> "int"            { return symbol(sym.INT, yytext()); }
<YYINITIAL> "return"              { return symbol(sym.RETURN, yytext()); }
<YYINITIAL> "void"           { return symbol(sym.VOID, yytext()); }
<YYINITIAL> "while"            { return symbol(sym.WHILE, yytext()); }

<YYINITIAL> {
  /* operators */
    "+"                            { return symbol(sym.PLUS, yytext()); }
    "-"                           { return symbol(sym.SUBTRACT, yytext()); }
    "*"                            { return symbol(sym.MULTIPLY, yytext()); }
    "/"                            { return symbol(sym.DIVIDE, yytext()); }
    "<"                           { return symbol(sym.LESS, yytext()); }
    "<="                            { return symbol(sym.LESSEQ, yytext()); }
    ">"                            { return symbol(sym.MORE, yytext()); }
    ">="                           { return symbol(sym.MOREEQ, yytext()); }
    "="                            { return symbol(sym.EQ, yytext()); }
    "=="                            { return symbol(sym.EQEQ, yytext()); }
    "!="                           { return symbol(sym.NOTEQ, yytext()); }
    "||"                            { return symbol(sym.OR, yytext()); }
    "&&"                            { return symbol(sym.AND, yytext()); }
    "!"                           { return symbol(sym.NOT, yytext()); }

    /* literals */
    {FloatLiteral}                { return symbol(sym.FLOATLITERAL, yytext()); }
    {DecIntegerLiteral}            { return symbol(sym.INTEGERLITERAL, yytext()); }
    {BooleanLiteral}                { return symbol(sym.BOOLEANLITERAL, yytext()); }
    {StringLiteral}+               { return symbol(sym.STRINGLITERAL, yytext()); }

    /* type */
    {Array}                         { return symbol(sym.ARRAY, yytext()); }

    /* identifiers */
    {Identifier}                   { return symbol(sym.IDENTIFIER, yytext()); }

    /* comments */
    {Comment}                      { return symbol(sym.COMMENT, yytext()); }

    /* separators */
    {Separator}                     {return symbol(sym.SEPARATOR, yytext());}

    /* whitespace */
    {WhiteSpace}                   { /* ignore */ }

    [()] | [{}]                    { /* ignore */ }
}

/* error fallback */
[^]                              { throw new Error("Illegal character <"+ yytext()+">"); }