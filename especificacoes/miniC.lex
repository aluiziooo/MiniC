package analisadorlexico;

import token.Token;

%%

%class AnalisadorLexico
%unicode
%type Token
%line
%column

LETRA = [a-zA-Z_]
DIGITO = [0-9]
PALAVRA = {LETRA}+
ALFA_NUMERICO = {LETRA}|{DIGITO}
ID = ({LETRA})({ALFA_NUMERICO} | _ )*
LI = ({DIGITO})+
LF = (({DIGITO})+.{DIGITO}+)
LC = '([^'\\n]|\\.)'
ESCAPE = (\\ \n\r\t\f])+
FINAL_LINHA = (\r | \n | \r\n | \t)
LS = \"(([^\"]|\\\")*[^\\])?\"
OA = ['+'-*/]
OL =  ['||' | '&&']
OC = '==' | '!=' | '<' | '>' | '<=' | '>='
ATR = [=]
OU = '!'
SP = [:;,(){}.#&]

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace     = {LineTerminator} | [ \t\f]

/* comments */
COMENTARIO = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
// Comment can be the last line of the file, without line terminator.
EndOfLineComment     = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*

%%
"main" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"{" { return new Token( "AC", yyline, yycolumn, yytext() ); }
"}" { return new Token( "FC", yyline, yycolumn, yytext() ); }
"(" { return new Token( "AP", yyline, yycolumn, yytext() ); }
")" { return new Token( "FP", yyline, yycolumn, yytext() ); }
"void" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"int" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"float" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"double" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"char" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"if" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"else" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"printf" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"printint" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"printstr" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"return" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"static" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"void" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"while" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"for" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"do" { return new Token( "PR", yyline, yycolumn, yytext() ); }
"include" { return new Token( "PR", yyline, yycolumn, yytext() ); }


{ID} { return new Token("IDENTIFICADOR", yyline, yycolumn, yytext() ); }
{LI} { return new Token("LITERALINTEIRO", yyline, yycolumn, yytext() ); }
{LF} { return new Token("LITERALPONTOFLUTUANTE",yyline, yycolumn, yytext()); }
{LC} { return new Token("LITERALCARACTER",yyline, yycolumn, yytext() ); }
{LS} { return new Token("LITERALSTRING", yyline, yycolumn, yytext()); }
{OA} {return new Token("OPERADORARITMETICO",yyline, yycolumn, yytext() ); }
{ATR} { return new Token("OPERADORCOMPARACAO", yyline, yycolumn, yytext() ); }
{OL} { return new Token("OPERADORLOGICOOR",yyline, yycolumn, yytext() ); }
{ATR} { return new Token("OPERADORATRIBUICAO", yyline, yycolumn, yytext() ); }
{OU} { return new Token("OPERADORUNARIONEGACAO",yyline, yycolumn, yytext() ); }
{SP} {return new Token("SIMBOLODEPONTUACAO",yyline, yycolumn, yytext() ); }

{COMENTARIO} { }

{FINAL_LINHA} {}

. { }