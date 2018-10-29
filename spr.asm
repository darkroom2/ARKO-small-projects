#sortuj stringa, malo optymalne xd
.data
text: .asciiz "ddeeba"
.text
.globl main

main:
	la $t0, text
	lb $t1, ($t0)
	li $s0, 0
loop:
	addiu $s0, $s0, 1
	addiu $t0, $t0, 1
	lb $t1, ($t0)
	bnez $t1, loop
	
#wracamy na poczatek
	la $t0, text
	lb $t1, ($t0)
	lb $t2, 1($t0)

#s0 ilosc znakow
loop2:
	li $s1, 0
	loop3:
		bge $s1, $s0, nextWhile
		blt $t1, $t2, nextFor
		
		sb $t2, ($t0)
		sb $t1, 1($t0)
	nextFor:
		addiu $s1, $s1, 1
		addiu $t0, $t0, 1
		lb $t1, ($t0)
		lb $t2, 1($t0)
		bnez $t2, loop3
nextWhile:
	la $t0, text
	lb $t1, ($t0)
	lb $t2, 1($t0)
	addiu $s0, $s0, -1
	bgt $s0, 1, loop2
	

	
end:
	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 10
	syscall