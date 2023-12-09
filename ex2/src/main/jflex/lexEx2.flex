package compi1.ex1;

import java.io.*;
import java_cup.runtime.*;

%%
%public
%class lexEx2
%cup
%function next_token

digito = [0-9]
letra = [a-zA-Z]
Whitespace = [ \t\f] | {LineTerminator}
LineTerminator = \r|\n|\r\n


%{
	StringBuffer string = new StringBuffer();
	
	private Symbol symbol(int type){
		return new Symbol(type, yyline, yycolumn);
	}
	private Symbol symbol(int type, Object value){
		return new Symbol(type, yyline, yycolumn, value);
	}
%}

%eofval{
	return symbol(ParserSym.EOF);
%eofval}
%%

<YYINITIAL>{letra}({letra}|{digito})* {return symbol (ParserSym.ID, yytext());}
<YYINITIAL>{digito}({digito})* {return symbol (ParserSym.NUM, yytext());}
<YYINITIAL>"," {return symbol (ParserSym.COMMA, yytext());}
<YYINITIAL>";" {return symbol (ParserSym.PCOMMA, yytext());}
<YYINITIAL>"{" {return symbol (ParserSym.LLA, yytext());}
<YYINITIAL>"}" {return symbol (ParserSym.LLC, yytext());}

<YYINITIAL>{Whitespace} {}

\n {yychar=1;}
. {System.err.println("warning: Unrecognized character '" + yytext()+"' -- ignored" + " at : "+ (yyline+1) + " " + (yycolumn+1) + " " + yychar);}

