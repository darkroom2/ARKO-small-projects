.data
text: .asciiz "tekst3333xd3t"
usun: .asciiz "t"
.text
.globl main
main:
	la $t0, text
	la $s0, text
	la $t1, usun
	lb $t2, ($t0)
	lb $t3, ($t1)
loop:
	beq $t2, $t3, skip
	sb $t2, ($s0)
	addiu $t0, $t0, 1
	addiu $s0, $s0, 1
	lb $t2, ($t0)
	bnez $t2, loop
loop2:
	la $t0, text
	la $s0, text
	addiu $t1, $t1, 1
	lb $t3, ($t1)
	bnez $t3, loop
skip:
	addiu $t0, $t0, 1
	lb $t2, ($t0)
	bnez $t2, loop
end:
	sb $t2, ($s0)
	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 10
	syscall