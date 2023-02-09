.data
	idade: .word 19 #valor inteiro na memória ram


.text

	li $v0, 1
	lw $a0, idade #vai no endereço de idade e coloca no registrado a0
	syscall
