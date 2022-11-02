%{
#include<stdio.h>
#include<stdbool.h>

bool Left_Array[26];
bool Right_Array[26];
int Left_Character[26];
int Right_Character[26]; 
int LeftIterator=0;
int RightIterator=0;

%}

%start Start_Func
%token Identifier L

%%                   

Start_Func:                      
         |
         Start_Func error '\n'
          {
           yyerrok;
          }
         |
         Start_Func left '.' right '\n'
          {
            function();
          }
         |
         Start_Func '\n'
         ;
left:     L Identifier
          {
            Left_Array[$2]=1;
            Left_Character[LeftIterator]= $2+ 'a';
            LeftIterator=LeftIterator+1;
          }
          |
          left L Identifier
          {
            Left_Array[$3]=1;
            Left_Character[LeftIterator]= $3+ 'a';
            LeftIterator=LeftIterator+1;
          }
          ;
right:    Identifier
          {
            Right_Array[$1]=1;
            Right_Character[RightIterator]= $1+ 'a';
            RightIterator=RightIterator+1;
          }
          |
          right Identifier
          {
            Right_Array[$2]=1;
            Right_Character[RightIterator]= $2+ 'a';
            RightIterator=RightIterator+1;
          }
          ;
%%

void function()
{
    for(int i=0; i<26; i++){
      if(Right_Array[i]==1 && Left_Array[i]==0){
        printf("string %c;\n", i+'a');
      }
    }
    printf("string fabc(");
    for(int i=0; i<26; i++){
      if(Left_Character[i]>0){
        printf("string %c, ", Left_Character[i]);
      }
    }
    printf("\b\b)\n{\n");
    printf("  return strcat(");
    for(int i=0; i<26; i++){
      if(Right_Character[i]>0){
        printf("%c , ", Right_Character[i]);
      }
    }
    printf("\b\b);\n}\n\n");
    for(int i=0; i<26; i++){
      Left_Character[i]=0;
      Right_Character[i]=0;
      Left_Array[i]=0;
      Right_Array[i]=0;
    }
    LeftIterator=0;
    RightIterator=0;
}

int main()
{
  for(int i=0; i<26; i++){
    Left_Character[i]=0;
    Right_Character[i]=0;
    Left_Array[i]=0;
    Right_Array[i]=0;
  }
  return(yyparse());
}

void yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}

int yywrap()
{
  return(1);
}