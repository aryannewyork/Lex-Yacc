%{

#include <stdio.h>
#include "y.tab.h"
int c;
%}
%%
" "       ;
[a-z]     {
            c = yytext[0];
            yylval = c - 'a';
            return(Identifier);
          }
[L]       {
            c = yytext[0];
            return(L);
          }
[^a-z\b]    {
                 c = yytext[0];
                 return(c);
              }
%%