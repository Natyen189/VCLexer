package main;

import java_cup.runtime.Symbol;

public class Token extends Symbol {

    public Token(int id) {
        super(id);
    }

    public Token(int id, Object o) {
        super(id, o);
    }

    @Override
    public String toString() {
        if(this.value != null)
            return "Token{ "
            + "Type=" + main.cup.VCParserSym.terminalNames[this.sym]
            + ", Value = " + this.value + " }";

        else
            return "Token{ "
            + "Type=" + main.cup.VCParserSym.terminalNames[this.sym] + "}";
    }
}
