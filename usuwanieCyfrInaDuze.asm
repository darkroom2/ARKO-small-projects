	.data
text:	.asciiz "t3k5t b3z cyfr 1 n4 duz3"
	.text
	.globl main
main:
	la $t0, text
	la $s0, text
	lb $t1, ($t0)
loop:
	blt $t1, '0', przepisz
	bgt $t1, '9', small

	addiu $t0, $t0, 1
	lb $t1, ($t0)
	bnez $t1, loop
	
small:
	blt $t1, 'a', przepisz
	bgt $t1, 'z', przepisz
	addiu $t1, $t1, -0x20
	sb $t1, ($s0)
	addiu $s0, $s0, 1
	addiu $t0, $t0, 1
	lb $t1, ($t0)
	bnez $t1, loop
przepisz:
	sb $t1, ($s0)
	addiu $s0, $s0, 1
	addiu $t0, $t0, 1
	lb $t1, ($t0)
	bnez $t1, loop
end:
	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 10
	syscall