.data
text: .asciiz "wtdXDDD"
.text
.globl main
main:
	la $t0, text
	la $t1, text
	lb $t2, ($t0)
	beqz $t2, end
goToEnd:
	addiu $t0, $t0, 1
	lb $t2, ($t0)
	bnez $t2, goToEnd
	
	addiu $t0, $t0, -1
	lb $t2, ($t0)
	
reachedEnd:
	lb $t2, ($t0)
	lb $t3, ($t1)
	sb $t2, ($t1)
	sb $t3, ($t0)
	addiu $t0, $t0, -1
	addiu $t1, $t1, 1
	bgt $t0, $t1, reachedEnd
end:
	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 10
	syscall