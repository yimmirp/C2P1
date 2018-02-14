/*------------  1ra Area: Codigo de Usuario ---------*/
//------> Paquetes,importaciones
package Analizadores;
import java_cup.runtime.*;
import java.util.LinkedList;

/*------------  2da Area: Opciones y Declaraciones ---------*/
%%
%{
    //----> Codigo de usuario en sintaxis java
    public static LinkedList<TError> TablaEL = new LinkedList<TError>(); 
%}

//-------> Directivas
%public 
%class Analizador_Lexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode

//------> Expresiones Regulares
dir = [0-9]+

//------> Estados

%%
/*------------  3raa Area: Reglas Lexicas ---------*/

//-----> Simbolos

<YYINITIAL> "<CHTML>"         { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.ha, yycolumn, yyline, yytext()); }
<YYINITIAL> "<FIN-CHTML>"     { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.hc, yycolumn, yyline, yytext()); }
<YYINITIAL> "<ENCABEZADO>"    { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.ena, yycolumn, yyline, yytext()); }
<YYINITIAL> "<FIN-ENCABEZADO>" { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.enc, yycolumn, yyline, yytext()); }
<YYINITIAL> "<"         { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.abre, yycolumn, yyline, yytext()); }
<YYINITIAL> ">"         { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.cierra, yycolumn, yyline, yytext()); }
<YYINITIAL> "CJS"         { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.cjs, yycolumn, yyline, yytext()); }
<YYINITIAL> "CCSS"         { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.ccss, yycolumn, yyline, yytext()); }
<YYINITIAL> "ruta"         { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.ruta, yycolumn, yyline, yytext()); }
<YYINITIAL> "="         { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.igual, yycolumn, yyline, yytext()); }
<YYINITIAL> '\"'         {System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.comilla, yycolumn, yyline,yytext());}
<YYINITIAL> "<FIN-CJS>" { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.fcjs, yycolumn, yyline, yytext());}
<YYINITIAL> "<FIN-CCSS>" { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.fccss, yycolumn, yyline, yytext());}
<YYINITIAL> ";" { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.pc, yycolumn, yyline, yytext());}
//-------> Simbolos ER
<YYINITIAL> {dir}    { System.out.println("Reconocio "+yytext()); return new Symbol(Simbolos.dir, yycolumn, yyline, yytext()); }

//------> Espacios
[ \t\r\n\f]             {/* Espacios en blanco, se ignoran */}

//------> Errores Lexicos
.                       { System.out.println("Error Lexico"+yytext()+" Linea "+yyline+" Columna "+yycolumn);
                          TError datos = new TError(yytext(),yyline,yycolumn,"Error Lexico","Simbolo no existe en el lenguaje");
                          TablaEL.add(datos);}