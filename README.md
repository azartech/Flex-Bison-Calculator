# Flex Bison Calculator-Compiler
• Supports the following math functions :  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Add - Subtract - Divide - Multiply - Power - Assignment - Sin - Cos - Sqrt - Abs - Exp - Sinh - Cosh  
• Can recognize both Integer and Float values.  
• Can recognize scientific values as Float (e.g. 314e-2 = 3.14).  
• Can Assign values to identifires using "=" sign.  
• Prints out a list of used Tokens in each command.  
• Prints out the final output of the enterd math function as a Double value.

# CFG
The equivalent CFG for the grammer used in this project is as follows :
```
stmts → stmt stmts
stmts → ε
stmt → 𝑖𝑑 {𝐸𝑚𝑖𝑡(lvalue + 𝑖𝑑. 𝑙𝑒𝑥)} = expr{𝐸𝑚𝑖𝑡("𝑎𝑠𝑠𝑖𝑔𝑛")};
expr → expr + term {𝐸𝑚𝑖𝑡("𝑎𝑑𝑑")}
expr → expr − term {𝐸𝑚𝑖𝑡("𝑠𝑢𝑏")}
expr → term
term → term ∗ unary {𝐸𝑚𝑖𝑡("𝑚𝑢𝑙")}
term → term / unary {𝐸𝑚𝑖𝑡("𝑑𝑖𝑣")}
term → unary
unary → −unary {𝐸𝑚𝑖𝑡("𝑛𝑒𝑔")}
unary → pow
pow → factor ^ pow {𝐸𝑚𝑖𝑡("𝑝𝑜𝑤")}
pow → factor
factor → id {𝐸𝑚𝑖𝑡("rvalue " + 𝑖d. 𝑙𝑒𝑥)}
factor → 𝑖𝑛𝑡 {𝐸𝑚𝑖𝑡("𝑝𝑢𝑠h " + 𝑖𝑛𝑡. 𝑙𝑒𝑥)}
factor → 𝑓𝑙𝑜𝑎𝑡 {𝐸𝑚𝑖𝑡("𝑝𝑢𝑠h " + 𝑓𝑙𝑜𝑎𝑡. 𝑙𝑒𝑥)}
factor → (expr)
factor → sin(expr) {𝐸𝑚𝑖𝑡("𝑠𝑖𝑛 " )}
factor → cos(expr){𝐸𝑚𝑖𝑡("𝑐𝑜𝑠 " )}
factor → sqrt(expr){𝐸𝑚𝑖𝑡("𝑠𝑞𝑟𝑡 " )}
factor → abs(expr){𝐸𝑚𝑖𝑡("𝑎𝑏𝑠 " )}
factor → exp(expr){𝐸𝑚𝑖𝑡("𝑒𝑥𝑝 " )}
factor → sinh(expr){𝐸𝑚𝑖𝑡("𝑠𝑖𝑛h " )}
factor → cosh(expr){𝐸𝑚𝑖𝑡("𝑐𝑜𝑠h ")}
```

# Usage
First of all, please make sure that both Flex and Bison are installed.  
To use the calculator, clone the project. Open command prompt and ```cd``` to the directory. Then use the following commands. If there were warnings, ignore them.  
```
bison -d -y calc.y
flex calc.lex
gcc -c y.tab.h y.tab.c lex.yy.c
gcc y.tab.o lex.yy.o -o $@ -lm
```  
A Unix executable file named "-lm" will be generated. open the file and enjoy!

# Example
```
a=2
T_IDEN  T_EQL  T_INT  = 2.000000
a^3
T_IDEN  T_POW  T_INT  = 8.000000

23 + sin(sqrt(16))
T_INT  T_ADD  T_SIN  T_PRNL  T_SQRT  T_PRNL  T_INT  T_PRNR  T_PRNR  = 22.243198

100 + 2e2
T_INT  T_ADD  T_FLOAT  = 300.000000
```
