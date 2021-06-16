package main;

import main.jflex.Lexer;
import java.io.FileReader;
import java.io.IOException;

public class LexerScanner {
    public static void main(String[] args) {
        String filepath = "C:/Users/legen/IdeaProjects/Compiler/resources/Input.txt";

        try {
            Lexer lex = new Lexer((new FileReader(filepath)));

            Token token;
            while((token = lex.next_token()) != null)
                System.out.println(token);
        }
        catch (IOException ex) {
            ex.printStackTrace(System.out);
        }
    }
}
