# Verilog HDL Compiler Front-End

A compiler front-end for a subset of the Verilog Hardware Description Language (HDL) developed using Flex (Lex), Bison (Yacc), GNU gperf, and C/C++.

## Features

- Lexical analysis of Verilog HDL source code
- Parsing of Verilog syntax using context-free grammar
- Recognition of Verilog keywords using GNU gperf
- Supports:
  - Module declarations
  - Port declarations
  - Wire declarations
  - Register declarations
  - Continuous assignment statements
- Syntax error detection and reporting

## Technologies Used

- C/C++
- Flex (Lex)
- Bison (Yacc)
- GNU gperf

## Development Environment

- Ubuntu on Windows Subsystem for Linux (WSL)

## Build Instructions

```bash
flex -o lexor.c pl.l
gperf -N check_identifier -L ANSI-C -t tools.gp > toolsGP.c
bison -t -d -o yacc.c tools.y
g++ -o mytool cmdpl.cpp lexor.c yacc.c toolsGP.c
```

## Run

```bash
./mytool test.v
```

## Project Structure

```
README.md
cmdpl.cpp
pl.l
tools.y
tools.gp
test.v
```

