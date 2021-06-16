package main;

public interface sym {

    /* Keywords */
    public static final int BOOLEAN = 0;
    public static final int BREAK = 1;
    public static final int CONTINUE = 2;
    public static final int ELSE = 3;
    public static final int FOR = 4;
    public static final int FLOAT = 5;
    public static final int IF = 6;
    public static final int INT = 7;
    public static final int RETURN = 8;
    public static final int VOID = 9;
    public static final int WHILE = 10;

    /* Identifiers */
    public static final int IDENTIFIER = 11;

    /* Operators */
    public static final int PLUS = 12;
    public static final int SUBTRACT = 13;
    public static final int MULTIPLY = 14;
    public static final int DIVIDE = 15;
    public static final int LESS = 16;
    public static final int LESSEQ = 17;
    public static final int MORE = 18;
    public static final int MOREEQ = 19;
    public static final int EQ = 20;
    public static final int EQEQ = 21;
    public static final int NOTEQ = 22;
    public static final int OR = 23;
    public static final int AND = 24;
    public static final int NOT = 25;

    /* Comments */
    public static final int COMMENT = 26;

    /* Comments */
    public static final int SEPARATOR = 27;

    /* EOF */
    public static final int EOF = 28;

    /* Literals */
    public static final int INTEGERLITERAL = 29;
    public static final int FLOATLITERAL = 30;
    public static final int BOOLEANLITERAL = 31;
    public static final int STRINGLITERAL = 32;
    public static final int ARRAY = 33;

    public static final String[] terminalNames = new String[] {
        "KEYWORD.BOOLEAN",
        "KEYWORD.BREAK",
        "KEYWORD.CONTINUE",
        "KEYWORD.ELSE",
        "KEYWORD.FOR",
        "KEYWORD.FLOAT",
        "KEYWORD.IF",
        "KEYWORD.INT",
        "KEYWORD.RETURN",
        "KEYWORD.VOID",
        "KEYWORD.WHILE",
        "IDENTIFIER",
        "OPERATORS.PLUS",
        "OPERATORS.SUBTRACT",
        "OPERATORS.MULTIPlY",
        "OPERATORS.DIVIDE",
        "OPERATORS.LESS",
        "OPERATORS.LESSEQ",
        "OPERATORS.MORE",
        "OPERATORS.MOREEQ",
        "OPERATORS.EQ",
        "OPERATORS.EQEQ",
        "OPERATORS.NOTEEQ",
        "OPERATORS.OR",
        "OPERATORS.AND",
        "OPERATORS.NOT",
        "COMMENT",
        "SEPARATOR",
        "EOF",
        "LITERAL.INTEGER",
        "LITERAL.FLOAT",
        "LITERAL.BOOLEAN",
        "LITERAL.STRING",
        "ARRAY",
    };
}
