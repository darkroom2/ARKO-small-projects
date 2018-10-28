	.data
text:	.asciiz "123412341234123"
	.text
	.globl main
main:
	la $t0, text
	lb $t1, ($t0)	# 1szy znak
	beqz $t1, end
loop:
	addiu $t0, $t0, 1
	lb $t2, ($t0)	# 2gi znak
	beqz $t2, end
	
	addiu $t0, $t0, 1
	lb $t3, ($t0)	# 3ci znak
	beqz $t3, end
	
	addiu $t0, $t0, 1
	lb $t4, ($t0)	# 4ty znak
	beqz $t4, end
	

	sb $t4, -3($t0)

	sb $t3, -2($t0)

	sb $t2, -1($t0)

	sb $t1, 0($t0)
	
	addiu $t0, $t0, 1
	lb $t1, ($t0)	# 1szy znak
	bnez $t1, loop
end:
	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 10
	syscall