
# Lambda expression to C function

This appliation converts a simple lambda expression into a C language function. It is written in LEX and YACC and compiled in windows using bison and flex. Provided here are final c files which can be compiled together to produce an executable and run the program.



## Authors

- [Aryan Shukla](https://www.github.com/aryannewyork)




## Deployment

To run this project follow the steps,

a) Clone this repository and simply run the following command

  ```bash
  gcc lex.yy.c y.tab.c
  .\a.exe
  ```
To run the project (on windows) from scratch,

  a) Download and Install [flex](https://gnuwin32.sourceforge.net/packages/flex.htm) and [bison](https://gnuwin32.sourceforge.net/packages/bison.htm)
  , Make sure to follow these [instructions](https://stackoverflow.com/questions/5456011/how-to-compile-lex-yacc-files-on-windows/5545924#5545924). Make sure the environment variables are set and also while installing flex and bison, make sure to select ```C:/``` path to install the program, don't install it in nested folders with different naming conventions like ```C:/Programfiles```.

  b) Run the following commands to compile the lex and yacc files,

  ```bash
  flex lambda.l
  bison -dy lambda.y
  gcc lex.yy.c y.tab.c
  .\a.exe
  ```

  c) four new files will be generated, one of them will be an executable called ```a.exe```
  This is where the final compiled code lies for the lambda expression to C convertor, run it and use the calculator.

This is an example on how to use it.

  ![WORKING](https://user-images.githubusercontent.com/79625246/199450921-7be5eeda-4170-4ea3-a9d0-454eaa9d8aaf.png)
