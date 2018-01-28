# Building

- if not include "counte.v" in testbench file.

```
$ iverilog -o main tb.v counter.v
```

- if include just specify testbench

```
$ iverilog -o main tb.v
```


# Run test bench

- specify vvp
- this command 'vvp' is 'icarus verilog vvp runtime engine'

```
$ vvp main
```

-  or just run
- Because the output "main" file is ascii script and vvp declared as shebang.

```
$ ./main
```

# View using gtkwave

- wave file as vcd output is written in testbench internally
- and it doesn't generate by iverilog compile
- have to run compiled execute file


# Know How

- testbench file is "MAYBE" need only one file in almost cases, so name tb.v
- instantiate object should set first ASAP, I confused the undeclared variables


