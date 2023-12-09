package compi1.ex2;

import java.util.ArrayList;

public class arbol {
	public String lex;
	public ArrayList<arbol> hijos;
	
	public arbol(String lex) {
		this.lex = lex;
		this.hijos = new ArrayList();
	}
	
	public void addHijo(arbol hijo) {
		this.hijos.add(hijo);
	}
	
	public void printArbol(arbol raiz) {
		for(arbol hijo : raiz.hijos) {
			printArbol(hijo);
		}
		System.out.println(raiz.lex);
	}
}