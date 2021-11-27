%{
    #include<stdio.h>
    #include<stdlib.h>
%}
Digit [0-9]
Letter [a-zA-Z] 

%%
if|else|while|for|switch|case|var|return|break|throw|catch|import|func|print  {printf("<Keyword, %s> ",yytext);}
true|false  {printf("<Boolean, %s> ", yytext);}
"+"|"-"|"*"|"/"|"="|"%"|"&"|"^"|"|"|"&&"|"||"|"!"|"~"|">>"|"<<"|"=="|"!="|"<="|">="|"<"|">"|"++"|"--"   {printf("<OP, %s> ", yytext);}
";"|","|"."|":"    {printf("<Mark, %s> ", yytext);}
\/\*([^\*^\/]*|[\*^\/*]*|[^\**\/]*)*\*\/    {printf("<Annotation, %s> ", yytext);}
"("|")"|"["|"]"|"{"|"}"    {printf("<Bracket, %s> ", yytext);}
[ ]     {printf("<Blank> ");}
[\n]    {printf("<Newline>\n");}
[\t]    {printf("<Tab> ");}
({Letter}|_)({Letter}|_|{Digit})*  {printf("<ID, %s> ", yytext);}
0x(0|1)*   {printf("<Num_0x, %s> ", yytext);}   
("-")?{Digit}+    {printf("<Num_INT, %s> ", yytext);}
("-")?{Digit}+.{Digit}+     {printf("<Num_FLOAT, %s> ", yytext);}   
["'"][a-zA-Z0-9_ !@#$%^&*;,.]+["'"]    {printf("<Str, %s> ", yytext);}
({Letter}|{Digit}|_)+("()")    {printf("<Func_pf, %s> ", yytext);}
%%

int main(){
    yyin=fopen("data.txt","r");
    yylex();
    return 0;
}
int yywrap(){
    return 1;
}