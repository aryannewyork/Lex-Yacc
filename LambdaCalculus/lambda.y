%{
  
#include<stdio.h>
#include<stdbool.h>

bool left[26];
bool right[26];
int leftChar[26];
int rightChar[26];
int itrLeft = 0;
int itrRight = 0;

int yylex();
int yyerror();
void function();
%}

%start startLabel

%token VAR LAMBDA


%%                   /* beginning of rules section */

startLabel:                       /*empty */
         |
        startLabel error '\n'
         {
           yyerrok;
         }
         |
         startLabel left '.' right '\n'
         {
          function();
         }
         |
         startLabel '\n'
         ;

left:   LAMBDA VAR
         {
          left[$2] = 1;
          leftChar[itrLeft] = $2 + 'a';
          itrLeft = itrLeft + 1;
         }
         ;

right:  VAR
        {
          right[$1] = 1;
          rightChar[itrRight] = $1 + 'a';
          itrRight = itrRight + 1;
        }
        |
        right VAR
        {
          right[$2] = 1;
          rightChar[itrRight] = $2 + 'a';
          itrRight = itrRight + 1;
        }
        ;
%%


void function() {
  for(int i = 0; i < 26; i++) {
    if(right[i] && !left[i]) {
      printf("string %c;\n", i + 'a');
    }
  }
  printf("string fabc(");
  for(int i = 0; i < 26; i++) {
    if(leftChar[i]) {
      printf("string %c, ", leftChar[i]);
    }
  }
  printf("\b\b)\n{\n");
  printf(" return strcat(");
  for(int i = 0; i < 26; i++) {
    if(rightChar[i]) {
      printf("%c, ", rightChar[i]);
    }
  }
  printf("\b\b);\n}\n\n");
  for(int i = 0; i < 26; i++) {
    leftChar[i] = 0;
    rightChar[i] = 0;
    left[i] = 0;
    right[i] = 0;
  }
  itrLeft = 0;
  itrRight= 0;
}


int main()
{
  for(int i = 0; i < 26; i++) {
    leftChar[i] = 0;
    rightChar[i] = 0;
    left[i] = 0;
    right[i] = 0;
  }
 return(yyparse());
}

int yyerror(char* s)
{
  fprintf(stderr, "%s\n",s);
}

int yywrap()
{
  return(1);
}