package main;

import java.io.*;

import java_cup.runtime.ComplexSymbolFactory;
import main.cup.VCParser;
import main.jflex.LexerScanner;

public class Main {
    public static void main(String[] args) {
        String filepath = "resources/Input.txt";
        String outputFilepath = "resources/Output.txt";

        try {
            // Init LexerScanner
            LexerScanner lex = new LexerScanner((new FileReader(filepath)));

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

            //Init Parser
            ComplexSymbolFactory csf = new ComplexSymbolFactory();
            VCParser Parser = new VCParser(lex, csf);
            Parser.parse();
            Parser.debug_parse(); //For debug
        }
        catch (Exception ex) {
            ex.printStackTrace(System.out);
        }
    }
}
