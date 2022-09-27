
# Calculator Using Lex and Yacc

It is a Calculator that is written in Lex and Yacc. It takes complex algebraic expressions as input and evaluates them according to mathematical rules of precedence.



## Authors

- [Aryan Shukla](https://www.github.com/aryannewyork)


## Deployment

To run this project follow the steps,

a) Clone this repository and simply run the following command

  ```bash
  gcc lex.yy.c y.tab.c -o calc.exe
  .\calc.exe
  ```
To run the project (on windows) from scratch,

  a) Download and Install [flex](https://gnuwin32.sourceforge.net/packages/flex.htm) and [bison](https://gnuwin32.sourceforge.net/packages/bison.htm)
  , Make sure to follow these [instructions](https://stackoverflow.com/questions/5456011/how-to-compile-lex-yacc-files-on-windows/5545924#5545924). Make sure the environment variables are set and also while installing flex and bison, make sure to select ```C:/``` path to install the program, don't install it in nested folders with different naming conventions like ```C:/Programfiles```.

  b) Run the following commands to compile the lex and yacc files,

  ```bash
  flex calc.l
  bison -dy calc.y
  gcc lex.yy.c y.tab.c -o calc.exe
  .\calc.exe
  ```

  c) four new files will be generated, one of them will be an executable called ```calc.exe```
  This is where the final compiled code lies for the calculator, run it and use the calculator.

This is an example on how to use it.

  ![Example](https://user-images.githubusercontent.com/79625246/192456690-a76abf27-7569-4a29-802f-9c6c459b121d.png)



