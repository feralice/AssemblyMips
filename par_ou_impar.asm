#lê um programa e diz se ele é par ou ímpar

.data

	msg: .asciiz "Forneça um número: "
	par: .asciiz "O numero e par"
	impar: .asciiz "O numero e impar"


.text

	#imprime mensagem para o usuário
	li $v0, 4
	la $a0, msg
	syscall
	
	#lê o número
	li $v0, 5
	syscall
	
	li $t0, 2
	div $v0, $t0
	
	mfhi $t1 #possui o resto da divisao por 2
	
	#branch if equal
	#se o t1(resto) for igual a 0 execute a partir de imprime par
	beq $t1, $zero, imprimePar
	#imprime mensagem para o usuário
	li $v0, 4
	la $a0, impar
	syscall
	
	#encerrar o programa
	li $v0, 10
	syscall
	
	#crio um rótulo
	imprimePar: 
		#imprime mensagem para o usuário
		li $v0, 4
		la $a0, par
		syscall
	