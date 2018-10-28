.data
text: .asciiz "maleNaDUZE"
.text
.globl main
main:
	la $t0, text
	lb $t1, ($t0)
loop:
	blt $t1, 'A', next
	bgt $t1, 'Z', next
	addiu $t1, $t1, 0x20
	sb $t1, ($t0)
next:
	addiu $t0, $t0, 1
	lb $t1, ($t0)
	bnez $t1, loop
end:
	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 10
	syscall
