package analisadorlexico;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import token.Token;

public class AnalisadorLexicoAPP {
	public static void main(String[] args){
		FileReader programaTeste;
		String path = new File("").getAbsolutePath()+"\\Programas\\ProgramaTeste.txt";

		 
		try {
			programaTeste = new FileReader(path);
			AnalisadorLexico analisador = new AnalisadorLexico(programaTeste);
			Token token = analisador.yylex();
			while (token != null) {

				System.out.println(token);

				token = analisador.yylex();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		

	}
	
}
