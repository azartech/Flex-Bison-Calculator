# Flex Bison Calculator-Compiler
Creating a calculator using Flex and Bison for university compiler project

# CFG
The equivalent CFG for the grammer used in this project is as follows :
'''
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
'''
