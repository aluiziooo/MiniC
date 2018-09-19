package geradoranalisadores;

import java.io.File;

public class GeradorClassesJflex {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		jflex.Main.generate(new File("especificacoes/miniC.lex"));
	}

}
