package main;

import main.jflex.Lexer;

import java.io.*;

public class LexerScanner {
    public static void main(String[] args) {
        String filepath = "C:/Users/legen/IdeaProjects/Compiler/resources/Input.txt";
        String outputFilepath = "C:\\Users\\legen\\IdeaProjects\\Compiler\\resources\\Output.txt";

        try {
            Lexer lex = new Lexer((new FileReader(filepath)));

            FileWriter outputWriter = new FileWriter(outputFilepath);
            BufferedWriter out = new BufferedWriter(outputWriter);

            Token token;
            while((token = lex.next_token()) != null)
            {
                out.write(token.toString());
                out.write("\n");
                out.flush();
            }
            out.close();
        }
        catch (IOException ex) {
            ex.printStackTrace(System.out);
        }
    }
}
