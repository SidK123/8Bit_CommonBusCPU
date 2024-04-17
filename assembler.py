import math

program = open("program.txt", 'r')
asm     = open("asm.txt"    , 'w')

instr_dict = {'ADD' : '0000', 
              'ADDI': '0001',
              'SUB' : '0010',
              'XOR' : '0011',
              'NAND': '0100',
              'SLL' : '0101',
              'SRL' : '0110',
              'SRA' : '0111',
              'NOR' : '1000',
              'BEQ' : '1001',
              'BGE' : '1010',
              'BLT' : '1011',
              'BNE' : '1100'}

reg_dict   = {'1': '001',
              '2': '010',
              '3': '011',
              '4': '100',
              '5': '101',
              '6': '110',
              '7': '111'}

for line in program:
    assembly_line = line.split(" ")
    for i in assembly_line:
        if (i == ' '  or i == ''):
            assembly_line.remove(i)
    print(assembly_line)
    instruction   = assembly_line[0]
    dest_reg      = assembly_line[1]
    dest_reg      = dest_reg.replace('x', '')
    source_reg    = assembly_line[2]
    source_reg    = source_reg.replace('x', '')
    operand_reg   = assembly_line[3]
    operand_reg   = operand_reg.replace('x', '')
    asm_instruction = ""
    
    asm_instruction += '0'
    asm_instruction += reg_dict[dest_reg]
    asm_instruction += reg_dict[source_reg]
    asm_instruction += reg_dict[operand_reg] 
    asm_instruction += instr_dict[instruction]
    asm_instruction = asm_instruction.replace('b', '')

    print(asm_instruction, file=asm)