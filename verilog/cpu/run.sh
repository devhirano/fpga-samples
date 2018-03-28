#!/bin/bash

iverilog -o tb_system tb_system.v

./tb_system

gtkwave -f tb_system.vcd

