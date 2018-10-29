# w stringu, uzywajac lw, sw only, zamienic pierwszy znak
# z ostatnim w kazdej "czworce" (word, 4bajty)
.data
text: .asciiz "abcdqwerrt"

.text
.globl main

main:
	la $t0, text
	lw $t1, ($t0)
loop:
	andi $t2, $t1, 0xFF000000
	beqz $t2, end
	andi $t3, $t1, 0x00FF0000
	beqz $t3, end
	andi $t4, $t1, 0x0000FF00
	beqz $t4, end
	andi $t5, $t1, 0x000000FF
	beqz $t5, end
	# tu dojdziemy jak nie ma zera
	srl $t2, $t2, 24
	sll $t5, $t5, 24
	
	or $t2, $t2, $t3
	or $t2, $t2, $t4
	or $t2, $t2, $t5
	
	sw $t2, ($t0)
next:
	addiu $t0, $t0, 4
	lw $t1, ($t0)
	b loop
end:
	li $v0, 4
	la $a0, text
	syscall
	
	li $v0, 10
	syscall