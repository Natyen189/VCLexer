/* JFlex example: partial Java language lexer specification */
import java_cup.runtime.*;
import main.Token;
import main.cup.VCParserSym;

/**
 * This class is a simple example lexer.
 */
%%

%class LexerScanner
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
%eofval{
  return new Token(VCParserSym.EOF);
%eofval}
%eof{
    System.exit(0);
%eof}
%eofclose

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

/* literal */
DecIntegerLiteral = 0 | [1-9][0-9]*

FloatLiteral  = ([0-9]*  \. [0-9]+ {Exponent}?) | ([0-9]+ \.) | ([0-9]+ (\.)? {Exponent})
Exponent = [eE] [+-]? [0-9]+

BooleanLiteral = "true" | "false"
StringLiteral = \"[^\"]*\"

/* array */
ArrayKeyword = "boolean" | "float" | "int"
Array = {ArrayKeyword}"[]"

%%

/* keywords */
<YYINITIAL> "boolean"           { return symbol(VCParserSym.BOOLEAN, yytext()); }
<YYINITIAL> "break"            { return symbol(VCParserSym.BREAK, yytext()); }
<YYINITIAL> "continue"              { return symbol(VCParserSym.CONTINUE, yytext()); }
<YYINITIAL> "else"           { return symbol(VCParserSym.ELSE, yytext()); }
<YYINITIAL> "for"            { return symbol(VCParserSym.FOR, yytext()); }
<YYINITIAL> "float"              { return symbol(VCParserSym.FLOAT, yytext()); }
<YYINITIAL> "if"           { return symbol(VCParserSym.IF, yytext()); }
<YYINITIAL> "int"            { return symbol(VCParserSym.INT, yytext()); }
<YYINITIAL> "return"              { return symbol(VCParserSym.RETURN, yytext()); }
<YYINITIAL> "void"           { return symbol(VCParserSym.VOID, yytext()); }
<YYINITIAL> "while"            { return symbol(VCParserSym.WHILE, yytext()); }

<YYINITIAL> {
  /* operators */
    "+"                            { return symbol(VCParserSym.PLUS, yytext()); }
    "-"                           { return symbol(VCParserSym.SUBTRACT, yytext()); }
    "*"                            { return symbol(VCParserSym.MULTIPLY, yytext()); }
    "/"                            { return symbol(VCParserSym.DIVIDE, yytext()); }
    "<"                           { return symbol(VCParserSym.LESS, yytext()); }
    "<="                            { return symbol(VCParserSym.LESSEQ, yytext()); }
    ">"                            { return symbol(VCParserSym.MORE, yytext()); }
    ">="                           { return symbol(VCParserSym.MOREEQ, yytext()); }
    "="                            { return symbol(VCParserSym.EQ, yytext()); }
    "=="                            { return symbol(VCParserSym.EQEQ, yytext()); }
    "!="                           { return symbol(VCParserSym.NOTEQ, yytext()); }
    "||"                            { return symbol(VCParserSym.OR, yytext()); }
    "&&"                            { return symbol(VCParserSym.AND, yytext()); }
    "!"                           { return symbol(VCParserSym.NOT, yytext()); }

    /* literals */
    {FloatLiteral}                { return symbol(VCParserSym.FLOATLITERAL, yytext()); }
    {DecIntegerLiteral}            { return symbol(VCParserSym.INTEGERLITERAL, yytext()); }
    {BooleanLiteral}                { return symbol(VCParserSym.BOOLEANLITERAL, yytext()); }
    {StringLiteral}+               { return symbol(VCParserSym.STRINGLITERAL, yytext()); }

    /* type */
    {Array}                         { return symbol(VCParserSym.ARRAY, yytext()); }

    /* identifiers */
    {Identifier}                   { return symbol(VCParserSym.IDENTIFIER, yytext()); }

    /* comments */
    {Comment}                      { return symbol(VCParserSym.COMMENT, yytext()); }

    /* separators */
    "("                             {return symbol(VCParserSym.LBRACK, yytext());}
    ")"                             {return symbol(VCParserSym.RBRACK, yytext());}
    "["                             {return symbol(VCParserSym.LBRACE, yytext());}
    "]"                             {return symbol(VCParserSym.RBRACE, yytext());}
    "{"                             {return symbol(VCParserSym.LTRIBRACE, yytext());}
    "}"                             {return symbol(VCParserSym.RTRIBRACE, yytext());}
    ","                             {return symbol(VCParserSym.COMMA, yytext());}
    ";"                             {return symbol(VCParserSym.SEMI, yytext());}


    /* whitespace */
    {WhiteSpace}                   { /* ignore */ }
}

/* error fallback */
[^]                              { throw new Error("Illegal character <"+ yytext()+">"); }