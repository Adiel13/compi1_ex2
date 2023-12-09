package compi1.ex2;

import java.io.StringReader;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws Exception
    {
        System.out.println( "---- Ejemplo 2 ----" );
        String entrada = "{3; x; 2; z}";
        lexEx2 lex = new lexEx2(new StringReader(entrada));
        Parser sintax = new Parser(lex);
        arbol raiz = (arbol)sintax.parse().value;
        raiz.printArbol(raiz);
        System.out.println( "---- Fin ejemplo 2 ----" );
    }
}
